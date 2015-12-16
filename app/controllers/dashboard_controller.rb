class DashboardController < ApplicationController
	delegate :current_user
	
	def index

		@events = find_events
		@cos = current_user.vehicles.all
		raise @cos.inspect
	end

	def show
	end

		#
		# zwracam wszystkie pasujące eventy
		#

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

	def time_to_terminate
		time = self.date_next_event.to_date - Time.now.to_date
		raise time.inspect
	end

end
