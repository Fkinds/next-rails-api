class Public::CartItemsController < ApplicationController
  before_action :checking_cart_item, only: [:create]
  def index
    cart_items = CartItem.all
    render json: cart_items, include: [:item]
  end

  def create
    if checking_cart_item
      checking_cart_item.update(amount: checking_cart_item.amount + params[:amount].to_i)
      render json: checking_cart_item 
    else
      cart_item = CartItem.new(params_cart_item)
      if cart_item.save
        render json: cart_item
      else
        render json: cart_item.errors
      end
    end
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
  end

  private
  def params_cart_item
    params.permit(:amount,:item_id)
  end

  def checking_cart_item
    CartItem.find_by(item_id: params[:item_id])
  end
end
