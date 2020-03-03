class RentalsController < ApplicationController
  before_action :set_rental, only[:destroy]

  def show
    @rentals = Rental.all
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render 'new'
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    #redirect_to dash_board
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :total_price) #adjust this later once we know how to calculate total price
  end

end
