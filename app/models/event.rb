class Event < ActiveRecord::Base
	belongs_to :vehicles
	has_many :types_of_events

	validates :name, :presence => true, length: { maximum: 255 }

	def type_event?
		type_id = self.type_of_event_id
		event = TypesOfEvent.find(type_id)
		return event.name
	end
	
end
