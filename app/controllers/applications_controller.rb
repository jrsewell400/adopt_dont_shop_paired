class ApplicationsController < ApplicationController

  def new
  end

  def create
    application = Application.create(strong_params)

    application.save

    pet_favorites.each do |pet|
      if session[:favorites].has_key?(pet.id)
        session[:favorites].delete(pet.id)
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
