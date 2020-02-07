class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :favorite_pet

  def favorite_pet
    @favorites ||= Favorite.new(session[:favorites])
  end
end
