class Vehicle < ActiveRecord::Base
	belongs_to :users
	has_one :types_of_vehicles
	has_many :documents
	has_many :events


end
