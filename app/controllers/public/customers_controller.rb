class Public::CustomersController < ApplicationController
  def session
    uid = request.headers['uid']
    if uid 
      data = "aaaa"
      render json: data
    else
      render status: 1
    end 
    # @customer = Customer.find_by_uid(uid)
    # render status: 200, json: @customer
  end
end
