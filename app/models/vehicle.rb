class Vehicle < ActiveRecord::Base
	belongs_to :users
	has_one :types_of_vehicles
end
