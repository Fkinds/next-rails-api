class Public::AddressesController < ApplicationController
  
  def index
    addresses = Address.all
    render json: addresses
  end
  
  def create
    address = Address.new(params_address)
    if address.save!
      render json: address
    else 
      render json: address.errors
    end
  end

  def show
    address = Address.find(params[:id])
    render json: address
  end

  def update
    address = Address.find(params[:id])
    if address.update(params_address)
      render json: address
    else 
      render json: address.errors
    end
  end
  
  private
  def params_address
    params.permit(:address, :name, :zip_code, :customer_id)
  end
end
