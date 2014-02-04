class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    index1_homes_path
  end
  
  def after_inactive_sign_up_path_for(resource)
    index1_homes_path
  end

end