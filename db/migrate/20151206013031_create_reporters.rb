class CreateReporters < ActiveRecord::Migration
  def change
    create_table :reporters do |t|
      t.string :email
      t.string :name
      t.string :interval
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
