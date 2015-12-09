class AddBroadcastToEvent < ActiveRecord::Migration
  def change
    add_column :events, :broadcast, :boolean, :null => false, :default => false
  end
end
