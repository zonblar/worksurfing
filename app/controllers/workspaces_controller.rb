class WorkspacesController < ApplicationController


  # before_filter :disable_nav

  def index
    @search_term = params[:search_term]
    @workspaces = Workspace.where.not(latitude: nil)

    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@workspaces) do |workspace, marker|
      marker.lat workspace.latitude
      marker.lng workspace.longitude
    end
  end

  def list
    @user = current_user
    @workspaces = current_user.workspaces
  end

  def edit
   @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    @workspace.update(workspace_params)
    redirect_to workspace_path(@workspace)
  end

  def show
    @workspace = Workspace.find(params[:id])
    @alert_message = "You are viewing #{@workspace.title}"
    @workspace_coordinates = { lat: @workspace.latitude, lng: @workspace.longitude }

  end

  def new
    @type_of_space = ["Coworking", "Appartement", "Bureau"]
    @workspace = Workspace.new
  end

  def destroy
     @workspace = Workspace.find(params[:id])
      @workspace.destroy
      redirect_to work_path
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = current_user
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
