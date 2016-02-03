class Vehicle < ActiveRecord::Base
	belongs_to :users
	has_one :types_of_vehicles
	has_many :documents
	has_many :events

  validates :name, :presence => true, length: { maximum: 255 }




  def update_mileage
  	sr = average_mileage / 365
  	sr += mileage 
  	self.update_column(:mileage, sr )
  end

end
