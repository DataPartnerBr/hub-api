class PeoplePj < ApplicationRecord
  #Validation data
  validates :cnpj, :bussiness_name, :fantasy_name, presence: true
end
