class AddDefaultValueToTestProcessing < ActiveRecord::Migration
  def change
    change_column_default(:tasks, :processing, false)
  end
end
