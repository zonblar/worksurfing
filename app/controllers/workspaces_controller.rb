class WorkspacesController < ApplicationController

  def index
    @workspaces = Workspace.all
  end
  def list
    @user = current_user
    @workspaces = current_user.workspaces
  end

  def show
    @workspace = Workspace.find(params[:id])
    @alert_message = "You are viewing #{@workspace.title}"
    @workspace_coordinates = { lat: @flat.latitude, lng: @flat.longitude }

  end

  def new
    @type_of_space = ["Coworking", "Appartement", "Bureau"]
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)

    @user_id = current_user.id

    if @workspace.save
      redirect_to new_workspace_availability_path(@workspace)
    else
      render :new
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:photo1, :photo_cache1,:title, :zipcode, :description, :address, :wifi, :bathroom, :rules, :printer, :price_per_day, :price_per_week, :type_of_space, photos: [])

  end
end
