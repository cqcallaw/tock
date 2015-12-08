class RemoveIntervalFromReporter < ActiveRecord::Migration
  def change
    remove_column :reporters, :interval, :string
  end
end
