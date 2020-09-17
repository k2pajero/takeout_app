class Items::DeleteInBasketsController < Items::ApplicationController
  def create
    basket = current_user.prepare_basket
    item = Item.find(params[:item_id])

    basket_item = basket.basket_items.find_by(item_id: item.id)
    basket_item.destroy!

    redirect_to basket_path
  end
end
