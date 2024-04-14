class Public::HomesController < ApplicationController
  def top
    customer = session[:customer_id]
    if customer.nil?
      render json: {}, status: :unauthorized
    else
      render json: customer, status: :ok
    end
  end
end
