class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  helper_method :events_for_vehicle

	protected
	  def layout_by_resource
	    if devise_controller? && resource_name == :user && action_name == 'sign_in'
	      "devise"
	    else
	      "application"
	    end
	  end
	  def after_sign_in_path_for(user)
	    root_path
	  end
end
