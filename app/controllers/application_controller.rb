class ApplicationController < ActionController::API
    # before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    # def authenticate_user!
    #     render json: { error: 'Not Authorized' }, status: 401 unless user_signed_in? || request.method == 'POST'
    # end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      end
    
end
