class RemoveListOfVechiclesIdFromFleet < ActiveRecord::Migration
  def change
    remove_column :fleets, :list_of_vechicles_id, :integer
  end
end
