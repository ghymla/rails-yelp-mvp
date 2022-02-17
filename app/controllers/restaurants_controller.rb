class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)

    redirect_to restaurant_path(@restaurant) if @restaurant.save
    render :new
  end

  def edit
  end

  def update
    if @restaurant.update(restaurants_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
