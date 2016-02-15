class WorkspacesController < ApplicationController

  def show
    @workspace = Workspace.find(params[:id])
  end

  def new
    @type_of_space = ["Coworking", "Appartement", "Bureau"]
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @user_id = current_user.id
    if @workspace.save
      redirect_to workspace_path(@workspace)
    else
      render :new
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:photo1, :photo_cache1,:title, :zipcode, :description, :address, :wifi, :bathroom, :rules, :printer, :price_per_day, :price_per_week, :type_of_space)
  end
end
