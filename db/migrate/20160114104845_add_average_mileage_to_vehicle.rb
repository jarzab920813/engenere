class AddAverageMileageToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :average_mileage, :integer
  end
end
