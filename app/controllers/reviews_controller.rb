class ReviewsController < ApplicationController
  def index

  end

  def new
  end

  def create
      review = Review.new({
        title: params[:title],
        rating: params[:rating],
        content: params[:content],
        image: params[:image]
        })

      review.save

      redirect_to '/shelters/#{shelter.id}'
    end

end
