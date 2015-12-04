class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :timestamp

      t.timestamps null: false
    end
  end
end
