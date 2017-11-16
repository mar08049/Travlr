class AddColumnPlaces < ActiveRecord::Migration[4.2]
  def change
    add_column :places, :memory, :string

  end
end
