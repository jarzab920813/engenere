class AddUserIdToFleets < ActiveRecord::Migration
  def change
    add_column :fleets, :user_id, :integer
  end
end
