class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :udpate, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  def new
    @item = Item.new
  end

  def update
    if @item.update(item_params)
        redirect_to item_path(@item.id)
    else
      render 'edit'
   end
  end

  def edit
  end

  def destroy
    @item.destory
    #redirect_to dash_board
  end

  private

  def set_item
    @item = item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:price_per_day, :brand, :model, :product_description, :item_category, :user_description, :condition)
  end
end

