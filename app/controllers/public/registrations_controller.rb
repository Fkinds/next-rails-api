class Public::RegistrationsController < DeviseTokenAuth::RegistrationsController
    # skip_before_action :verify_authenticity_token, only: [:create]

    def after_sign_up_path_for(resource)
        root
    end

    def create
        super 
    end

    def new
        
    end

    private

    def sign_up_params
        params.permit(:email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number, :confirm_success_url)
    end
end
