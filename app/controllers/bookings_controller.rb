class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end



  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @booking = Booking.new(booking_params)

    @booking.workspace = @workspace
    if @workspace.available?(@booking)
      @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to workspace_path(@workspace)
      flash[:alert]
    end

  end

  def list
    @user = current_user
    @bookings = current_user.bookings
  end



  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
