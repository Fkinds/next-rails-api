class Public::SessionsController < ApplicationController
    before_action :configure_sign_in_params, only: [:create]

    def after_sign_up_path_for(resource)
        root
    end

    def create 
        super 
    end
    
    def destroy
        super
    end

    protected
    def configure_sign_in_params
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end
end
