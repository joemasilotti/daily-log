class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_authenticated

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      sign_in @user
      redirect_to days_path, notice: "Welcome to Daily Log!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
