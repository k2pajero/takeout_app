class Charge
  def initialize
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  end

  def create!(price, token)
    Stripe::Charge.create({
      amount: price,
      currency: 'jpy',
      description: 'Example charge',
      source: token
    })
  end

  def self.create!(price, token)
    charge = self.new
    charge.create!(price, token)
  end
end