class Public::CustomersController < ApplicationController
  def set_customer
    # receive_customer_id = session[:customer_id]
    @current_customer = Customer.find_by(id: session[:customer_id])
    if @current_customer
      render status: 200, json: @current_customer
    else
      render status: 400, json: @current_customer
    end 
  end

  def show

  end  
end
