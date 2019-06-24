class Api::V1::RegistrationsController < Devise::RegistrationsController

    before_action :ensure_params_exist, only: :create

    def create
        
        user = User.create!(user_params)
        if user.save
            json_response "Signed Up successfully", true, {user: user}, :ok
        else
            json_response "Something is Wrong", false, {}, :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def ensure_params_exist
        return if params[:user].present?
        json_response "Missing Parameters", false, {}, :bad_request
    end
end