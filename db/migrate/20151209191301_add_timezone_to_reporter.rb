class AddTimezoneToReporter < ActiveRecord::Migration
  def change
    add_column :reporters, :timezone, :string, :default => "Pacific Time (US & Canada)"
  end
end
