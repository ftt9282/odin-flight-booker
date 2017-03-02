class FlightsController < ApplicationController
  def index
    @arrivals = Airport.arrivals.map { |a| [a.code, a.id] }
    @departures = Airport.departures.map { |d| [d.code, d.id] }
    @dates = Flight.distinct.pluck(:start_date)
    @found_flights = Flight.where(start_airport_id: params[:start_airport_id], 
    							  finish_airport_id: params[:finish_airport_id])
    
    if params[:commit] == "Submit"
      if @found_flights.empty?
      	flash[:danger] = "No flights found..."
      	redirect_to root_path
      end
    end
  end

  private

  def flight_params 
    params.require(:flight).permit(:start_airport_id, :finish_airport_id, :start_date, :passenger_count, :commit)
  end
end
