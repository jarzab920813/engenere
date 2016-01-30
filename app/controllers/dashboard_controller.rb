class DashboardController < ApplicationController

	before_filter :authenticate_user!
	def index

		@events = find_events.sort_by {|obj| obj.date_next_event}
		# @cos = current_user.vehicles.all
		@vehicles = Vehicle.where(:user_id => current_user.id)
		# raise @cos.inspect
	end

	def show

	end

	def find_events
		vehicles   = Vehicle.where(:user_id => current_user.id)
		events_all = []

		vehicles.each do |vehicle|
			events = Event.where(:vehicle_id => vehicle.id)

			events.each do |event|				
				events_all << event 
			end
		end
		return events_all
	end

	def find_vehicles
		vehicles   = Vehicle.where(:user_id => current_user.id)
		events_all = []

		vehicles.each do |vehicle|
			events = Event.where(:vehicle_id => vehicle.id)

			events.each do |event|				
				events_all << event 
			end
		end
		return events_all
	end

	def events_for_vehicle(vehicle)
		@events = Event.where(:vehicle_id => vehicle.id)
		return @events
	end

	def time_to_terminate
		time = self.date_next_event.to_date - Time.now.to_date
		raise time.inspect
	end

end
