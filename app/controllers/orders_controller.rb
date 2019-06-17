class OrdersController < ApplicationController
  layout 'admin'
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(total: 0)
    CartItem.transaction do
      @order.save!
      CartItem.all.each do |item|
        @order.items.create!(
          product_id: item.product_id,
          quantity: item.quantity
        )
        @order.total += item.spend
      end
      @order.save!
      CartItem.delete_all
    end

    redirect_to order_confirmation_url(@order.id)
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:total)
    end
end
