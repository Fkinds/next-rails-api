class Public::CustomersController < ApplicationController
  def set_customer
    receive_customer_id = session[:customer_id]
    current_customer = Customer.find(receive_customer_id)
    if current_customer
      render json: current_customer
    else
      render status: 1
    end 
  end

  def show

  end  
end
