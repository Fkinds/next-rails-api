class Public::AddressesController < ApplicationController
  
  def index
    addresses = Address.all
    render json: addresses
  end
  
  def create
    address = Address.new(address_params)
    if address.save!
      render json: address
    else 
      render json: address.errors
    end
  end

  private
  def address_params
    params.permit(:address, :name, :zip_code, :customer_id)
  end
end
