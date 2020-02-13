class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :application_pets
  has_many :applications, through: :application_pets

  validates_presence_of :name, :image, :age, :sex

  def shelter_name
    Shelter.find(self.shelter_id)[:name]
  end
end

# @shelters.find(pet.shelter_id)[:name]
