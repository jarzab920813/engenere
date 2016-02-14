class CreateTypesOfEvents < ActiveRecord::Migration
  def change
    create_table :types_of_events do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
