class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user!
    render json: { error: 'Not Authorized' }, status: 401 unless user_signed_in? || request.method == 'POST'
  end

  def default_url_options
    if Rails.env.production?
      { host: 'gofreelancer.up.railway.app' }
    else
      { host: 'localhost', port: 3000 }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password])
  end
end
