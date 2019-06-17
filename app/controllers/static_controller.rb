class StaticController < ApplicationController
  # def home
  # end

  # def contact
  # end

  def shop
    @products = Product.all
  end
end
