# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airport_codes = ["ATL", "ORD", "LAX", "DFW", "DEN", "JFK", "SFO", "CLT"]

airport_codes.each do |iata|
  Airport.create!(code: iata)
end

Flight.create!(start_airport_id: 1,
			   finish_airport_id: 2,
			   start_date: Time.zone.now,
			   duration: 4) 

Flight.create!(start_airport_id: 3,
			   finish_airport_id: 4,
			   start_date: 1.day.ago,
			   duration: 2) 

Flight.create!(start_airport_id: 1,
			   finish_airport_id: 2,
			   start_date: Time.zone.now,
			   duration: 6) 