class StaticController < ApplicationController
  # def home
  # end

  # def contact
  # end

  def shop
    @products = Product.all
  end

  def product_details
    @product = Product.find(params[:id])
  end

  def add_to_cart
    id = params[:id]
    qty = params[:quantity] || 1
    ci = CartItem.where(product_id: id).first
    if ci
      ci.quantity += 1
    else
      ci = CartItem.new(product_id: id, quantity: qty)
    end
    ci.save!

    render json: {status: '200', message: "OK"}
  end

  def cart
    @items = CartItem.includes(:product).all.to_a
    @total = @items.map {|item| item.product.price * item.quantity }.sum
  end
end
