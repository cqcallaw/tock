class AddDefaultValueToTestAttempts < ActiveRecord::Migration
  def change
    change_column_default(:tasks, :attempts, 0)
  end
end
