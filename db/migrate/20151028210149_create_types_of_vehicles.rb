class CreateTypesOfVehicles < ActiveRecord::Migration
  def change
    create_table :types_of_vehicles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
