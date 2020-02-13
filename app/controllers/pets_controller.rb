class PetsController < ApplicationController

  def index
    @pets = Pet.all
    @shelters = Shelter.all
    
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])

    pet = shelter.pets.create(strong_params)

    if pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
      flash[:notice] = "Pet successfully created"
    else
      redirect_to "/shelters/#{shelter.id}/pets/new"
      flash[:error] = pet.errors.full_messages.to_sentence
    end

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

    if pet.save
      redirect_to "/pets/#{pet.id}"
      flash[:notice] = "Pet successfully edited"
    else
      redirect_to "/pets/#{pet.id}/edit"
      flash[:error] = pet.errors.full_messages.to_sentence
    end
  end

  def destroy
    Pet.destroy(params[:id])
    if session[:favorites] && session[:favorites].include?(params[:id])
      session[:favorites].delete(params[:id])
    end
    redirect_to '/pets'
  end

  private
  def strong_params

    params.permit(:name, :image, :description, :age, :sex, :adopted, :shelter_id)
  end
end
