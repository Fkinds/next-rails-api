class Public::HomesController < ApplicationController
  def top
    customer = session[:customer_id]
    # session[:customer_id] = customer
    if customer.nil?
      render json: {}, status: :unauthorized
    else
      render json: customer, status: :ok
    end
  end
end
