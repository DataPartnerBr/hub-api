class Transfer < ApplicationRecord

  # Enum category options
  enum category: [:transfer, :income]

  # Association
  belongs_to :account

  # Validation
  validates :category, :amount, presence: true
  validate :category_valid
  alias_attribute :recipient_account_id, :account_id

  #Generate the token for transfers
  has_secure_token :token

  # Update accounts
  after_save :update_accounts


  # Check for transaction rules
  def category_valid
    recipient = Account.find(account_id)
    if recipient.active?
      if income?
        true
      elsif account_transfer_id.present? && recipient.is_branch?
        sender = Account.find(account_transfer_id)
        if sender.active? && sender.is_branch == false
          if sender.is_child?(recipient)
            true
          else
            errors.add(:account, "Recipient account must child of Sender")
          end
        else
          errors.add(:account, "Sender account must be active")
        end
      else
        errors.add(:account, "Sender account must be present")
      end
    else
      errors.add(:account, "Recipient account must be active")
    end
  end

  # For reverse transfer
  def reverse!(token = "")
    self.reverse?
    if self.income?
      self.save if self.token == token
    else
      self.save
    end
  end

  # Update accounts in transaction
  def update_accounts
    Transfer.transaction do
      self.amount = -(self.amount) if reverse?
      recipient = Account.find(account_id)
      recipient.update_balance(amount)

      if transfer?
        sender = Account.find(account_transfer_id)
        sender.update_balance(-amount)
      end
    end
  end
end
