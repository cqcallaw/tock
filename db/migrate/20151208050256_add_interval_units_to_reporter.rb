class AddIntervalUnitsToReporter < ActiveRecord::Migration
  def change
    add_column :reporters, :interval_units, :string
  end
end
