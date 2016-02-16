class AvailabilitiesController < ApplicationController

  def new
     @workspace = Workspace.find(params[:workspace_id])
    @availability = Availability.new
  end

  def create
     @availability = Availability.new(availability_params)
     @workspace = Workspace.find(params[:workspace_id])
     @availability.workspace_id = @workspace.id
     if @availability.save
      redirect_to workspace_path(@workspace)
     else
      render :new
    end
  end

  def availability_params
    params.require(:availability).permit(:start_date, :end_date)
  end
end
