class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    passenger_count = params[:passenger_count].to_i
    passenger_count.times do 
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.create(booking_params)
    @booking.passengers.each do |passenger|
      passenger.send_flight_email
    end
    redirect_to @booking
  end

  def show
  	@booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      :passengers_attributes => [:name, :email])
  end
end
