class CreatePeoplePjs < ActiveRecord::Migration[5.2]
  def change
    create_table :people_pjs do |t|
      t.string :cnpj
      t.string :bussiness_name
      t.string :fantasy_name

      t.timestamps
    end
  end
end
