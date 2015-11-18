class Event < ActiveRecord::Base
	belongs_to :vehicles
	has_many :types_of_events
end
