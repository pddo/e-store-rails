module ApplicationHelper
  def format_price(price)
    "$%0.2f" % [price]
  end
end
