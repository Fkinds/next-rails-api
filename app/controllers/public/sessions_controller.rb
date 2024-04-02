class Public::SessionsController < ApplicationController
    def index
        if current_customer
            render json: { is_deleted: false, data: current_customer }
        else
            render json: { is_deleted: true, message: "ユーザが退会済です" }
        end
    end
end
