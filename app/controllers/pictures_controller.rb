class PicturesController < ApplicationController
  before_action :set_picture, only: [:update, :destroy]

  def create
    @picture = Picture.new(picture_params)
    @picture.item = Item.find(params[:item_id])
    if @picture.save
        redirect_to edit_item_path(@picture.item.id)
    else
      redirect_to edit_item_path(@picture.item.id)
    end

  end

  def udpate
    if @picture.update(picture_params)
      redirect_to edit_item_path(@picture.item.id)
    else
      redirect_to edit_item_path(@picture.item.id) #Add a error/alert/notifcation
    end
  end

  def destroy
    @picture.destory
    redirect_to edit_item_path(@picture.item.id)
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:description, :photo)
  end

end
