class AddEnumStatusToRentals < ActiveRecord::Migration[6.1]
  def change
    change_column :rentals, :status, :integer
  end
end
