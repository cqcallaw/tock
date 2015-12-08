class AddIntervalToReporter < ActiveRecord::Migration
  def change
    add_column :reporters, :interval, :int
  end
end
