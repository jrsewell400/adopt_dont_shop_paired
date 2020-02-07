class PetsController < ApplicationController

  def index
    @pets = Pet.all
    @shelters = Shelter.all
    # require "pry"; binding.pry
    @favorite = Favorite.new(session[:favorites])
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])

    pet = shelter.pets.create(strong_params)

    pet.save

    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(strong_params)

    pet.save

    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  private
  def strong_params

    params.permit(:name, :image, :description, :age, :sex, :adopted, :shelter_id)
  end
end
