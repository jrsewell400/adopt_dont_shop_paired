class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :quantity

  def quantity
    if session[:favorites]
      session[:favorites].count
    else
      0
    end
  end
end
