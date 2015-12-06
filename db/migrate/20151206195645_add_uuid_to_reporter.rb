class AddUuidToReporter < ActiveRecord::Migration
  def change
    add_column :reporters, :uuid, :string
  end
end
