class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :destroy]

  def show
  end

  def create
    @rental = Rental.new(rental_params)
    @user = current_user
    @item = Item.find(params[:item_id])
    @rental.item = @item
    @rental.user = @user
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render 'new'
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to dashboard_path
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :total_price) #adjust this later once we know how to calculate total price
  end

end
