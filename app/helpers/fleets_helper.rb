module FleetsHelper
  def find_vehicles(fleet)
    vehicles = Vehicle.where(:fleet_id => fleet.id)
    vehicles
  end
end
