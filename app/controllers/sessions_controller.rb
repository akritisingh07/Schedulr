class SessionsController < ApplicationController
  def new
  end
  def create
    # Authenticate the user
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user/omniauth_callbacks, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    # Log out the user
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully."
  end
end


  def create
    super
    Rails.logger.debug "Redirecting after login: #{after_sign_in_path_for(resource)}"
  end
