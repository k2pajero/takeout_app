class ChargesController < ApplicationController
  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params[:stripeToken]
    item_ids = params[:item_ids].map(&:to_i)
    # カート内の商品id達（paramsの中の配列文字列）を数値の配列で返す
    
    # items = current_user.basket.items.where(id: item_ids)
    # 今買い物かごに入っている商品の中から対象の商品と同じIDの商品
    # total = items.sum(:price)

    # basket_items = current_user.basket.basket_items.where(item_id: item_ids)
    # basket_items.each(&:destroy!)
    # 買い物かごを削除

    # Stripe::Charge.create({
    #   amount: total,
    #   currency: 'jpy',
    #   description: 'Example charge',
    #   source: token
    #   })
    # chargeモデルに移動
    # Charge.create!(total, token)

    # purchase_record = prepare_purchase_record
    # ids = item_ids.map { |id| { item_id: id } }
    # purchase_record.purchase_record_items.create!(ids)
    # idsはレコードを作成するcreate!の引数に入れる配列array を作っている
    current_user.checkout!(token, item_ids: item_ids)
    redirect_to root_path, notice: '決済に成功しました'
  end
end
