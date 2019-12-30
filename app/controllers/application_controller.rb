class ApplicationController < ActionController::Base
  before_action :configure_parmitted_parameters, if: :devise_controller?

  protected

  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
    [:nickname, :last_name, :first_name,:last_name_k, :first_name_k,
     :year, :month, :date, :phone_number, :icon])
  end
end
