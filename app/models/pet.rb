class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :application_pets

  validates_presence_of :name, :image, :age, :sex
end
