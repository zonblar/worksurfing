class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = user.new
  end

  def create
    user.create(user_params)
    redirect_to users_path
  end

  def edit
  end

  def update
    user.update(user_params)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :job, :portfolio, :description, :gender)
  end

  def set_user
    @user = user.find(params[:id])
  end

end
