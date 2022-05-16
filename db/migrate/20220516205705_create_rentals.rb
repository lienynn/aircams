class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :camera, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
