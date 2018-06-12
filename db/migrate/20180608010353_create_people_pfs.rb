class CreatePeoplePfs < ActiveRecord::Migration[5.2]
  def change
    create_table :people_pfs do |t|
      t.string :cpf
      t.string :full_name
      t.date :born_at

      t.timestamps
    end
  end
end
