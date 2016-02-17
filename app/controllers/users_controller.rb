class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  # def new
  #   @gender = ["Femme", "Homme"]
  #   @user = User.new
  # end

  # def create
  #   @user = User.new
  #   user.create(user_params)

  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end

  # end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :job, :portfolio, :description, :gender, :picture)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
