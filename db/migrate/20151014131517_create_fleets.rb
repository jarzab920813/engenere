class CreateFleets < ActiveRecord::Migration
  def change
    create_table :fleets do |t|
      t.string :name
      t.string :list_of_vechicles_id

      t.timestamps null: false
    end
  end
end
