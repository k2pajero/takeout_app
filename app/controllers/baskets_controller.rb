class BasketsController < ApplicationController
  before_action :authenticate_user!
  # ログインしていないと current_user が取得できずにエラーになるのを防ぐ
  def show
    basket = current_user.prepare_basket
    # basket情報の取得
    # Userモデルにprepare_basketメソッドを定義して簡略化
    # basket = current_user.basket || current_user.create_basket
    @items = basket.items.order(created_at: 'DESC')
    # basket からitems の一覧を取得し、ビューで表示できるようにする。
    # 一覧なので複数形のインスタンス変数になる
    @total_price = basket.total_price
  end
end
