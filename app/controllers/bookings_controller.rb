class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @booking = @workspace.bookings.new(booking_params)
    @booking.save

    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
