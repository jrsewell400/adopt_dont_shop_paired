class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :favorite_pet, :quantity

  # def favorite_pet
  #   @favorites ||= Favorite.new(session[:favorites])
  # end

  def quantity
    if session[:favorites]
      session[:favorites].count
    else
      0
    end
  end
end
