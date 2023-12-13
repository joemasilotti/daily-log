class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_authenticated, except: :destroy

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

  def destroy
    current_user.destroy!
    clear_honeybadger_context
    redirect_to root_path, notice: "Your account and all associated data have been deleted."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
