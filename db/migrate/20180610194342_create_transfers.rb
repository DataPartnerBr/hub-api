class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.references :account,          foreign_key: true, on_delete: :cascade
      t.integer :category
      t.decimal :amount,              precision: 10, scale: 2, null: false,  default: 0
      t.string :token
      t.integer :account_transfer_id
      t.boolean :reverse,            default: '0'

      t.timestamps
    end
  end
end
