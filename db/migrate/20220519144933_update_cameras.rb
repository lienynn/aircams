class UpdateCameras < ActiveRecord::Migration[6.1]
  def change
    rename_column :cameras, :zip_code, :address
  end
end
