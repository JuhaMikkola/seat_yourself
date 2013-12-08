class RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = Reservation.new
    @review = Review.new
    # @reservation = @restaurant.reservations.build
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_url
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end


  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to "/restaurants/#{@restaurant.id}"
    else
      render :edit
    end
  end

 
  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :neighborhood, :pricerange, :capacity, :image, :category_id)
  end

end
