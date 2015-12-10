class AddDefaultIntervalToReporter < ActiveRecord::Migration
  def change
    change_column :reporters, :interval, :int, :default => 1
  end
end
