class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:create]

  def new
  end

  def create
    if @user.present?
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end

  private

  def set_user
    @user = login(user_params[:email], user_params[:password])
  end

  def user_params
    params.permit(:email, :password)
  end
end
