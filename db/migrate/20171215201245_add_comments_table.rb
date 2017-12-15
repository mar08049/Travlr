class AddCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :description
    end
  end
end
