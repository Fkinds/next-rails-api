class Public::RegistrationsController < DeviseTokenAuth::RegistrationsController

    def after_sign_up_path_for(resource)
        root
    end

    def create
        super 
    end

    def new
        super
    end

    private

    def sign_up_params
        params.permit(:email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number, :confirm_success_url)
    end
end
