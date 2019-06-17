class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def spend
    product.price * quantity
  end
end
