class AccountsController < ApplicationController
  skip_before_action :authorize!
  def new
    @user = User.new
  end
  def create
    @user = User.new(account_params)
    if @user.save
      cookies.encrypted[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
  private
  def account_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
