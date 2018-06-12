class PeoplePf < ApplicationRecord
  #Validation data
  validates :cpf, :full_name, :born_at, presence: true
end

