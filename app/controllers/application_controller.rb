class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Cookies

  # before_action :require_login
  # before_action :check_xhr_header

  # helpers_method :current_customer

  private

  # def check_xhr_header
  #   return if request.xhr?
  #   render json: { error: 'forbidden' },status: :forbidden
  # end

  # def require_login
  #   @current_customer = Customer.find_by(id: session[:customer_id])
  #   return if @current_customer
  #   render json: { error: 'unauthorized' }, status: :unauthorized
  # end

  # def current_customer
  #   @current_customer ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]
  # end
end
