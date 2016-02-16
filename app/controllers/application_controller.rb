class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def disable_nav
    @disable_nav = true
  end


def redirect_back_or(path)
  redirect_to request.referer || path
end

end
