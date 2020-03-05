class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @rental = Rental.find(params[:rental_id])
    @review.rental = @rental
    # raise
    if @review.save
      redirect_to rental_path(@rental)
    else
      redirect_to rental_path(@rental)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
