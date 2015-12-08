class AddAttemptsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :attempts, :integer
  end
end
