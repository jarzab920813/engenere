class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date_event_start
      t.date :date_next_event
      t.integer :current_mileage
      t.integer :mileage_to_next_event
      t.integer :vehicle_id
      t.integer :type_of_event_id

      t.timestamps null: false
    end
  end
end
