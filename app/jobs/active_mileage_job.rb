class ActiveMileageJob < ActiveJob::Base
  queue_as :default

  def perform
    vehicles = Vehicle.all
    vehicles.each do |v|
      if v.mileage != nil && v.average_mileage != nil
        mileage_to_add = v.average_mileage/(365/7)
        v.mileage += mileage_to_add
        v.save
      end
   	end
  end
end
