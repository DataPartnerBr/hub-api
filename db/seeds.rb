# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless PeoplePf.any?

  (1..9).each do |i|
    puts "Creating Clients PF #{i}"
    PeoplePf.create!(
      cpf: "1231231234#{i}",
      full_name: "Pessoa #{i}",
      born_at: "199#{i}/05/24"
    )
  end
end




unless PeoplePj.any?

  (1..9).each do |i|
    puts "Creating Clients PJ #{i}"
    PeoplePj.create!(
      cnpj: "1122233300011#{i}",
      bussiness_name: "RZ #{i}",
      fantasy_name: "Juridica #{i}"
    )
  end
end
