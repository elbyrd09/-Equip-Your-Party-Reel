class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:query].present?
      @items = Item.search_by_brand_and_model_and_item_category(params[:query])
    else
      @items = Item.geocoded
    end

    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: {item: item}),
        image_url: helpers.asset_url('marker.png')
      }
    end
  end

  def show
    @rental = Rental.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    authorize @item
    if @item.save
      redirect_to edit_item_path(@item)
    else
      render 'new'
    end
  end

  def new
    @item = Item.new
    @picture = Picture.new
    authorize @item
  end

  def update
    @picture = Picture.new
    authorize @item
    if @item.update(item_params)
        redirect_to item_path(@item.id)
    else
      render 'edit'
   end
  end

  def edit
    @picture = Picture.new
    authorize @item
  end

  def destroy
    authorize @item
    @item.destroy
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

