class ChargesController < ApplicationController
  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params[:stripeToken]
    item_ids = params[:item_ids].map(&:to_i)
    # binding.pry
    # カート内の商品id達（paramsの中の配列文字列）を数値の配列で返す

    items = current_user.basket.items.where(id: item_ids)
    # 今買い物かごに入っている商品の中から対象の商品と同じIDの商品
    total = items.sum(:price)
    Stripe::Charge.create({
                            amount: total,
                            currency: 'jpy',
                            description: 'Example charge',
                            source: token
                          })
    redirect_to root_path, notice: '決済に成功しました'
  end
end
