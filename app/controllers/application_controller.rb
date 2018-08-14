class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      # redirect to vendor or consumer
      #super
      if resource.has_role? :vendor 
        vendor_dashboard_path
      else
        dashboard_path
      end
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
end
