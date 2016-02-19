class WorkspacesController < ApplicationController


  # before_filter :disable_nav

  def index
    params_hash = { city: params[:city],
                    nb_people: params[:nb_people],
                    printer: params[:printer],
                    bathroom: params[:bathroom],
                    wifi: params[:wifi] }

    search_query = ""
    if  params[:price_per_day].to_i != 0
      search_query << "(price_per_day BETWEEN (#{params[:price_per_day].to_i - (params[:price_per_day].to_i/10)})
                                      AND (#{params[:price_per_day].to_i + (params[:price_per_day].to_i/10)}))"
    end

    params_hash.each do |key, value|
      search_query << " AND (#{key.to_s} = #{params_hash[key]}) " unless params_hash[key] = "" || params_hash[key] = nil
    end

    if  Workspace.search_for(search_query).count >= 0
      @workspaces = Workspace.search_for(search_query)
    else
      @workspaces = Workspace.all
    end

    # AND (start_date <= #{params[:start_date]} AND end_date => #{params[:end_date]})
    # add attributes to Workspace

    @workspaces = @workspaces.where.not(latitude: nil)
    # Let's DYNAMICALLY build the markers for the view.
    @workspaces = Workspace.all
    @markers = Gmaps4rails.build_markers(@workspaces) do |workspace, marker|
      marker.lat workspace.latitude
      marker.lng workspace.longitude
    end
  end

  def list
    @user = current_user
    @workspaces = current_user.workspaces
  end

  def advanced_search

  end

  def listed
    @workspace = Workspace.find(params[:workspace_id])
    @workspace.update_attribute(:listed, false)
    redirect_to :back
  end

  def unlisted
    @workspace = Workspace.find(params[:workspace_id])
    @workspace.update_attribute(:listed, true)
    redirect_to :back
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
      redirect_to workspace_path(@workspace)
    else
      render :new
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:nb_people, :photo1, :photo_cache1, :title, :city, :zipcode, :description, :address, :wifi, :bathroom, :rules, :printer, :price_per_day, :price_per_week, :type_of_space, photos: [])

  end
end
