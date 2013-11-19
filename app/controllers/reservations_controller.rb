class ReservationsController < ApplicationController

 def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save 
      redirect_to restaurants_url
    else
      render :new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :start_time, :people, :restaurant_id)
  end

end
