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
end
