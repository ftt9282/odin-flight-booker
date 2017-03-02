class PassengerMailer < ApplicationMailer
  def flight_confirmation(passenger)
  	@passenger = passenger
  	mail to: passenger.email, subject: "Flight Confirmation"
  end
end
