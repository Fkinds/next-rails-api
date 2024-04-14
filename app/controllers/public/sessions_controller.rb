class Public::SessionsController < DeviseTokenAuth::SessionsController
    before_action :configure_sign_in_params, only: [:create]
    # skip_before_action :verify_authenticity_token, only: [:create]

    def after_sign_up_path_for(resource)
        root
    end

    def create 
        reset_session
        customer = Customer.find_by(email: params[:email])
        session[:customer_id] = customer.id
        if customer && customer.valid_password?(params[:password])
            token = customer.create_new_auth_token

            render json: {
                data: customer.as_json.merge({
                    access_token: token['access-token'],
                    client: token['client'],
                    uid: token['uid']
                })
            }, status: :ok
        else
            render json: { error: 'Ivalid email or password' }, status: :unauthorized
        end
    end
    
    def destroy
        # 認証情報を含むヘッダーからトークン情報を取得
        client_id = request.headers['client']
        uid = request.headers['uid']
        access_token = request.headers['access-token']

        # トークン情報を使用してユーザーを特定し、トークンを無効化する
        customer = Customer.find_by(id: session[:customer_id])
        customer.tokens.delete(client_id) && reset_session if customer

        if customer.present? && customer.save
            reset_session
            render json: { message: 'ログアウトしました' }
        else 
            render json: { errors: ['ログアウトに失敗しました']}, status: :unprocessable_entity
        end
    end

    protected
    def configure_sign_in_params
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end
end
