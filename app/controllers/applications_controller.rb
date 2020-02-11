class ApplicationsController < ApplicationController

  def new
    @pets = Pet.all
    @pet_favorites = Array.new
    @pets.each do |pet|
      if session[:favorites] && session[:favorites].has_key?(pet.id.to_s)
        @pet_favorites << pet
      end
    end
  end

  def show
    @application = Application.find(params[:id])
  end

  def index
    @applications = Application.all

    @applications.each do |app|
     if !app.pets.include?(Pet.find(params[:id]))
       flash[:notice] = "This Pet has no applications yet."
     end
   end
  end

  def update
    @application = Application.find(params[:app_id])
    pet = Pet.find(params[:id])
    if pet.adopted == 'Adoptable'
      pet.update_column(:adopted, 'Adoption Pending')
      redirect_to "/pets/#{params[:id]}"
    else
      pet.update_column(:adopted, 'Adoptable')
      redirect_to "/application/#{params[:app_id]}"
    end
  end

  def create
    @pet_ids = params[:pet_ids]

    application = Application.create!(strong_params)

    if params[:pet_adopts]
      params[:pet_adopts].each do |pet_id|
        if session[:favorites].has_key?(pet_id)
          session[:favorites].delete(pet_id)
        end
      end
    end
    application_pet = params[:pet_adopts].each do |pet_id|
                    ApplicationPet.create(pet_id: pet_id.to_i,
                    application_id: application.id)
                    end
      if application.save
        flash[:notice] = "Application for Pets Received!"
      else
        flash[:notice] = "Need to fill out all fields to submit an application"
      end
    redirect_to '/favorites'
  end
  private

  def strong_params
    params.permit(:pet_favorites, :name, :address, :city, :state, :zip, :phone_number, :description)
  end
end
