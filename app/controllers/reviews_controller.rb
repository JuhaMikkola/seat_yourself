class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
  
    @review = Review.new(review_params)

     if @review.save

        redirect_to restaurant_path(params[:restaurant_id])

      else

        redirect_to :root
      
      end
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :restaurant_id, :comment)
  end

end
