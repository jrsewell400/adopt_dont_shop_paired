class Application < ApplicationRecord
  has_many :application_pets

  validates_presence_of  :name, :address, :city, :state, :zip, :phone_number, :description
end
