class Items::AddToBasketsController < Items::ApplicationController
  def create
    basket = current_user.prepare_basket
    # Userモデルにprepare_basketメソッドを定義して簡略化
    # basket = current_user.basket || current_user.create_basket
  end
end