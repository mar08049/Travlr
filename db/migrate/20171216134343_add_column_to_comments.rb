class AddColumnToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :name, :string, default: 'Anonymous'
  end
end
