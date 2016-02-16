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
    @booking.workspace_id = @workspace.id
    if @booking.save
      redirect_to booking_path(@booking)

    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
