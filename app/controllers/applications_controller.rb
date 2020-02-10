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

  def create
    application = Application.create(strong_params)
  if params[:pet_adopts]
    params[:pet_adopts].each do |pet_id|
      if session[:favorites].has_key?(pet_id)
        session[:favorites].delete(pet_id)
      end
    end
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
