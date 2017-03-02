class Airport < ApplicationRecord
  has_many :arriving_flights, class_name: "Flight", foreign_key: "finish_airport_id"
  has_many :departing_flights, class_name: "Flight", foreign_key: "start_airport_id"

  def Airport.arrivals
    find(Flight.distinct.pluck(:start_airport_id))
  end

  def Airport.departures
    find(Flight.distinct.pluck(:finish_airport_id))
  end
end