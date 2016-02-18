class PaymentsController < ApplicationController
  before_action :set_order

  def create
  @amount = @booking.amount_cents

  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email: params[:stripeEmail]
  )
  # You should store this customer id and re-use it.

  charge = Stripe::Charge.create(
    customer:     customer.id,
    amount:       @amount,  # in cents
    description:  "Payment for Booking #{@booking.workspace.title} for order #{@booking.id}",
    currency:     'eur'
  )

  @booking.update(payment: charge.to_json, state: 'paid')

  redirect_to booking_path(@booking)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_payment_path(@booking)
end




  def new
  end


private

  def set_order
    @booking = Booking.where(state: 'pending').find(params[:booking_id])
  end
end
