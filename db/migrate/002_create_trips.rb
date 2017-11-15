class CreateTrips < ActiveRecord::Migration[4.2]
  def change
    create_table :trips do |t|
      t.integer :date

    end
  end
end
