class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)                    # creation d'un nouveau com
    @restaurant = Restaurant.find(params[:restaurant_id])   # récupération du restaurant a qui appartien le nouveau com
    @review.restaurant = @restaurant                        # je créé le lien entre mon com et le restau
    if @review.save
      redirect_to restaurant_path(@restaurant) if @review.save
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
