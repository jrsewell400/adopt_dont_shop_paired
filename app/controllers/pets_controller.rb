class PetsController < ApplicationController

  def index
    @pets = Pet.all
    @shelters = Shelter.all
  end

  def create
    pet = Pet.new({
      image: params[:image],
      name: params[:name],
      description: params[:description],
      age: params[:age],
      sex: params[:sex],
      adopted: params[:adopted] = "Adopted",
      shelter_id: 1
      })

    pet.save

    redirect_to '/shelters/1/pets'
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      name: params[:name],
      description: params[:describe],
      age: params[:age],
      sex: params[:sex],
      adopted: params[:adopted]
      })

    pet.save

    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end
end
