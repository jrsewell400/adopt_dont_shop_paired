class ReviewsController < ApplicationController
  def index
  end

  def new
    @shelter_id = params[:id]
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])

    review.update(strong_params)

    if review.save
      redirect_to "/shelters/#{review.shelter_id}"
      flash[:notice] = "Review successfully edited."
    else
      redirect_to "/shelters/#{review.shelter_id}/review/edit"
      flash[:notice] = "Need to fill in a Title, Rating, and Content in order to submit a Shelter Review."
    end
  end

  def create
    shelter = Shelter.find(params[:id])
    review = shelter.reviews.create(strong_params)

    if review.save
      redirect_to "/shelters/#{params[:id]}"
      flash[:notice] = "Review successfully created."
    else
      flash[:notice] = "Need to fill in a Title, Rating, and Content in order to submit a Shelter Review."
      render :new
    end
  end

  def destroy
    Review.destroy(params[:id])
    redirect_to "/shelters/#{params[:id]}"
  end


  private
  def strong_params

    params.permit(:title, :rating, :content, :picture, :shelter_id)
  end

end
