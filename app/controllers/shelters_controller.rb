class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end

  def show
    @shelter = Shelter.find(params[:id])
    @reviews = Review.all
  end

  def create
    shelter = Shelter.new(strong_params)

    shelter.save

    redirect_to '/shelters'
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(strong_params)

    if shelter.save
      redirect_to "/shelters/#{shelter.id}"
      flash[:notice] = "Shelter successfully edited."
    else
      redirect_to "/shelters/#{shelter.id}/edit"
      flash[:error] = shelter.errors.full_messages.to_sentence
    end 
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  private

    def strong_params
      params.permit(:name, :address, :city, :state, :zip)
    end
end
