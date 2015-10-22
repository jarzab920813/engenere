class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :year
      t.string :brand
      t.string :model
      t.string :vin
      t.string :registration_number
      t.string :type_of_vehicle_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
