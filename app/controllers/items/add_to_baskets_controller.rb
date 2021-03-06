class Items::AddToBasketsController < Items::ApplicationController
  def create
    basket = current_user.prepare_basket
    # Userモデルにprepare_basketメソッドを定義して簡略化
    # basket = current_user.basket || current_user.create_basket
    item = Item.find(params[:item_id])
    basket.basket_items.create!(item_id: item.id)
    # basket_itemの作成（リレーションを組んでからでないとできないメソッド。複数形に注意）
    # 商品を選択するだけでユーザの入力ミスはありえないのでcreate!としている
    redirect_to basket_path
  end
end
