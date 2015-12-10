class AddDefaultIntervalUnitToReporter < ActiveRecord::Migration
  def change
    change_column :reporters, :interval_units, :string, :default => "days"
  end
end
