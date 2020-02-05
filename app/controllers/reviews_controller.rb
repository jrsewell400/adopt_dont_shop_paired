class ReviewsController < ApplicationController
  def index
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])
    review = shelter.reviews.create(strong_params)

    if review.save
      redirect_to "/shelters/#{params[:id]}"
    else
      flash[:notice] = "Need to fill in a Title, Rating, and Content in order to submit a Shelter Review."
      render :new
    end
  end

  def show

  end

  private
  def strong_params

    params.permit(:title, :rating, :content, :picture, :shelter_id)
  end

end
