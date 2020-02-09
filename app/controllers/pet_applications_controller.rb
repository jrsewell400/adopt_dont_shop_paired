class PetApplicationsController < ApplicationController

  def new
    pets = Pet.all
    @pet_favorites = Array.new
    pets.each do |pet|
      if session[:favorites] && session[:favorites].has_key?(pet.id.to_s)
        @pet_favorites << pet
      end
    end
  end

  def create
    params[:pet_ids].each do |id, v|
      if session[:favorites].has_key?(id)
        session[:favorites].delete(id)
      end
    end
    flash[:notice] = "Application for Pets Received!"

    redirect_to '/favorites'
  end

end
