class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper
  def index
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet_id_str = pet.id.to_s
    require "pry"; binding.pry
    session[:favorites] ||= Hash.new(0)
    require "pry"; binding.pry
    # require "pry"; binding.pry
    session[:favorites][pet_id_str] ||= 0
    session[:favorites][pet_id_str] = session[:favorites][pet_id_str] + 1
    quantity = session[:favorites][pet_id_str]
    flash[:notice] = "You have added #{pet.name} to Favorites!"
    redirect_to "/pets/#{params[:pet_id]}"
  end
end
