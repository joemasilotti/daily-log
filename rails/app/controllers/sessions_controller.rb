class SessionsController < ApplicationController
  def create
    if (user = User.authenticate_by(authentication_params))
      sign_in user
      redirect_to root_path, notice: "You are now signed in."
    else
      render :new, status: :unprocessable_entity, alert: "Invalid email or password."
    end
  end

  def destroy
    sign_out current_user
    redirect_to root_path, notice: "You are no longer signed in."
  end

  private

  def authentication_params
    {email: params[:email], password: params[:password]}
  end
end
