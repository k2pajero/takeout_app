class ChargesController < ApplicationController
  def create
    # binding.pry
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params[:stripeToken]
    Stripe::Charge.create({
                            amount: 999,
                            currency: 'jpy',
                            description: 'Example charge',
                            source: token
                          })
    redirect_to root_path, notice: '決済に成功しました'
  end
end
