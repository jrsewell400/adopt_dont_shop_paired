class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :quantity, :pet_favorites

  def pet_favorites
    pets = Pet.all
    @pet_favorites = Array.new
    pets.each do |pet|
    if session[:favorites] && session[:favorites].has_key?(pet.id.to_s)
      @pet_favorites << pet
      end
    end
  end

  def quantity
    if session[:favorites]
      session[:favorites].count
    else
      0
    end
  end
end
