class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @pets = Pet.all
    @pet_favorites = Array.new
    @pets.each do |pet|
      if session[:favorites].has_key?(pet.id.to_s)
        @pet_favorites << pet
      end
    end
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet_id_str = pet.id.to_s
    session[:favorites] ||= Hash.new(0)
    session[:favorites][pet_id_str] ||= 0
    session[:favorites][pet_id_str] = session[:favorites][pet_id_str] + 1
    quantity = session[:favorites][pet_id_str]
    flash[:notice] = "You have added #{pet.name} to Favorites!"
    redirect_to "/pets/#{params[:pet_id]}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    pet_id_str = pet.id.to_s

    session[:favorites].delete(pet_id_str)
    flash[:notice] = "#{pet.name} has been removed from favorites."

    redirect_to "/pets/#{params[:pet_id]}"
  end
end
