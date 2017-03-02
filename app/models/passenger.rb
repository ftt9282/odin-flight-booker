class Passenger < ApplicationRecord
  def send_flight_email
    PassengerMailer.flight_confirmation(self).deliver_now
  end
end
