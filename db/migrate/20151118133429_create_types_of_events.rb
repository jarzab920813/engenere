class CreateTypesOfEvents < ActiveRecord::Migration
  def change
    create_table :types_of_events do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
