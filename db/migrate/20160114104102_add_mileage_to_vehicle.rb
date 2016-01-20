class AddMileageToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :mileage, :integer
  end
end
