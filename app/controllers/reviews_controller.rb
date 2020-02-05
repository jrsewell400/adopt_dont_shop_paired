class ReviewsController < ApplicationController
  def index
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])

    review = shelter.reviews.create!(strong_params)

    review.save
    redirect_to "/shelters/#{params[:id]}"
  end

  def show

  end

  private
  def strong_params

    params.permit(:title, :rating, :content, :picture, :shelter_id)
  end

end
