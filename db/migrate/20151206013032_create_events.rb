class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :timestamp
      t.references :reporter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
