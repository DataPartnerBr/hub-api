class Account < ApplicationRecord

  # Enum options status
  enum status: [:canceled, :active, :blocked]

  # Association
  belongs_to :people_pf, optional: true
  belongs_to :people_pj, optional: true
  has_many :transfers, dependent: :destroy

  # Validation data
  validates :name, presence: true, uniqueness: true
  validate :people_presence

  alias_attribute :parent_account_id, :account_id

  # Check is account is child
  def is_child? (child_account)
    if child_account.accounts_id == id
      return true
    else
      return false
    end
  end

  # Update de balance
  def update_balance(amount)
    self.balance += amount
    self.save
  end

  private

  # Check point for account, need a client presence. PJ or PF
  def people_presence
    if people_pjs_id.nil? and people_pfs_id.nil?
      errors.add(:account, "Not Allow null value.")
    elsif people_pjs_id > 0 and people_pfs_id > 0
      errors.add(:account, "Allow unique Client, please try again.")
    elsif people_pjs_id.blank? and people_pfs_id.blank?
      errors.add(:account, "Not Allow Blank value.")
    elsif people_pjs_id == 0 and people_pfs_id == 0
      errors.add(:account, "Must be select a Client.")
    end
  end


end
