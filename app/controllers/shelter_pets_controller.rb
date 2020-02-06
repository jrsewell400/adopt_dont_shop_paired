class ShelterPetsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:id])
    @pets = Pet.all
  end
end
