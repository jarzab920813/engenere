class AddCostsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :cost, :decimal
  end
end
