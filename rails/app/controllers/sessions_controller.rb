class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :redirect_if_authenticated, only: :new

  def create
    if (user = User.authenticate_by(authentication_params))
      sign_in user
      redirect_to days_path, notice: "You are now signed in."
    else
      flash.now.alert = "Invalid email or password."
      render :new, status: :unprocessable_entity
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
