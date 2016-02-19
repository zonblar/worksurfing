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
    @booking.user = current_user

    number_of_days = (@booking.end_date.to_date - @booking.start_date.to_date).to_i
    @booking.amount_cents = (((number_of_days * @workspace.price_per_day) + 1) * 100)
    @booking.workspace = @workspace
    @booking.state = 'pending'
    if @booking.save
      redirect_to new_workspace_booking_payment_path(@workspace, @booking)
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
