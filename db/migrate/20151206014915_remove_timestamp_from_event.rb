class RemoveTimestampFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :timestamp, :timestamp
  end
end
