class UsersController < ApplicationController
  # before_action :check_log_in

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to cats_url
    else
      render action: 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def check_log_in
      if !current_user.nil?
        redirect_to cats_url
      end
    end
end
