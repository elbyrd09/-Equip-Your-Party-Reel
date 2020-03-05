class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.geocoded
    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
        # infoWindow: render_to_string(partial: "info_window", locals: {item: item})
        # image_url: helpers.asset_url('https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678111-map-marker-512.png')
      }
    end
  end

  def show
    @rental = Rental.new
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
    @picture = Picture.new
  end

  def update
    @picture = Picture.new
    if @item.update(item_params)
        redirect_to item_path(@item.id)
    else
      render 'edit'
   end
  end

  def edit
    @picture = Picture.new
  end

  def destroy
    @item.destory
    redirect_to dashboard_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:price_per_day, :brand, :model, :product_description, :item_category, :user_description, :condition)
  end
end

