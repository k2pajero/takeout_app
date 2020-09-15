class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :genre_category_id, :saize_category_id, :unit, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
