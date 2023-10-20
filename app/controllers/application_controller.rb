class ApplicationController < ActionController::API
  before_action :comfigure_permitted_parameters, if: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken

  protected

  def comfigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username name avatar])
  end
end
