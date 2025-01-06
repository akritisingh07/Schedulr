class ApplicationController < ActionController::Base
    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    def after_sign_in_path_for(resource)
      Rails.logger.debug "Redirecting to: #{stored_location_for(resource) || posts_path}"
      stored_location_for(resource) || posts_path
    end
    def after_sign_out_path_for(resource_or_scope)
      flash[:notice] = "You have successfully logged out."
      new_user_session_path
    end
end
