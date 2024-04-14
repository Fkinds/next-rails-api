class Public::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # skip_before_action :verify_authenticity_token, only: [:create]

  def after_sign_up_path_for(resource)
    root
  end

  def create
    @customer = Customer.new(sign_up_params)
    if @customer.save!
      session[:customer_id] = @customer.id
      render json: @customer, status: 200
    else 
      render json: @customer.errors, status: 500
    end
  end

  def new
    
  end

  private

  def sign_up_params
    params.permit(:email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number, :confirm_success_url, :password_confirmation)
  end
end
