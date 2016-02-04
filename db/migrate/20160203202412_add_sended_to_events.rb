class AddSendedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :sended, :boolean
  end
end
