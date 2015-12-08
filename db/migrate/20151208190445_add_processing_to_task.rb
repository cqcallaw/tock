class AddProcessingToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :processing, :boolean
  end
end
