# frozen_string_literal: true

module ItemDecorator
  def display_price
    case unit
    when 'yen'
      "#{price.to_s(:delimited)} 円"
    when 'usd'
      "$ #{price.to_s(:delimited)}"
    end
  end
end
