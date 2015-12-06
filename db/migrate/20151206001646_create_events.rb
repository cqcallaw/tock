class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :timestamp
      t.references :timeline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
