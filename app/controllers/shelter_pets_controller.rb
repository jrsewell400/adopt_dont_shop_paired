class ShelterPetsController < ApplicationController
  def index
    @shelter = Shelter.first
    @pets = Pet.all
  end
end
