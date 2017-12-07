class AddColumnToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :trip_id, :integer
    add_column :places, :user_id, :integer
  end
end
