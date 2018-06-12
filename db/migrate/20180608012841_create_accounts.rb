class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :people_pjs, default:0
      t.references :people_pfs, default:0
      t.references :accounts
      t.string :name,             unique:true
      t.boolean :is_brunch,        null: false,  default: 0
      t.integer :status,          null: false,  default: 1
      t.decimal :balance,         precision: 10, scale: 2, null: false,  default: 0

      t.timestamps
    end
  end
end
