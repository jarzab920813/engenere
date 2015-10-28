class AddFleetIdToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :fleet_id, :integer
  end
end
