class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Cookies
  # include ActionController::RequestForgeryProtection

  def current_customer
    if session[:customer_id]
      @current_customer ||= Customer.find_by(id: session[:customer_id])
    end
  end
end
