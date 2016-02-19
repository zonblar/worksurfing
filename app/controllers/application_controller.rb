class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # application_controller.rb
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) << :first_name
end

  def disable_nav
    @disable_nav = true
  end


def redirect_back_or(path)
  redirect_to request.referer || path
end

end
