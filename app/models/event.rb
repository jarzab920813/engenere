class Event < ActiveRecord::Base
	belongs_to :vehicles
	has_many :types_of_events
	belongs_to :user

	validates :name, :presence => true, length: { maximum: 255 }

	def type_event?
		type_id = self.type_of_event_id
		event = TypesOfEvent.find(type_id)
		return event.name
	end

	def pass_mail
		UserMailer.pass_reminder(self.user, self).deliver
	end
	
end
