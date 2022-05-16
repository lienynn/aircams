class CreateCameras < ActiveRecord::Migration[6.1]
  def change
    create_table :cameras do |t|
      t.string :model
      t.integer :price_per_day
      t.string :zip_code
      t.text :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
