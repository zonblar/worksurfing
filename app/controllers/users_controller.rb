class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

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
    user.update(user_params)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :job, :portfolio, :description, :gender)
  end

  def set_user
<<<<<<< HEAD
    @user = user.find(params[:id])
=======
    @user = User.find(params[:id])
>>>>>>> 35041f6d8a021b3a1a2de764773472c571170c7f
  end

end
