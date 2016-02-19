class RegistrationsController < Devise::RegistrationsController
  protected

  def after_home_path_for(resource)
    new_workspace_path(resource)
  end

end
