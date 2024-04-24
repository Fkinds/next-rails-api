class Public::CustomersController < ApplicationController
  def set_customer
    if @current_customer
      render status: 200, json: @current_customer
    else
      render status: 400, json: @current_customer
    end 
  end
end
