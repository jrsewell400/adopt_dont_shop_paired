class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates_presence_of :name, :address, :city, :state, :zip

  def count_of_pets
    pets.length
  end

  def avg_rating
    count = 0
    reviews.each do |review|
      count += review.rating
    end
    if !reviews.empty?
      count / reviews.length.round(2)
    end
  end

  def num_apps
    pet_apps = ApplicationPet.all
    pet_ids = Array.new
      pet_apps.each do |app|
        pets.each do |pet|
        if app.pet_id == pet.id
          pet_ids << app.pet_id
        end
      end
    end
      pet_ids.uniq.count
  end

  def applications?
    app_pets = []
    pets.each do |pet|
      if !pet.applications.empty?
        app_pets << pet
      end
    end
    app_pets.empty?
  end
end
