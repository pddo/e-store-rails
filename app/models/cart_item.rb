class CartItem < ApplicationRecord
  belongs_to :product

  def spend
    product.price * quantity
  end
end
