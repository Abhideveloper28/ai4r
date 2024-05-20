class AddFieldsToFruit < ActiveRecord::Migration[7.1]
  def change
    add_column :fruits, :color, :string
    add_column :fruits, :size, :string
    add_column :fruits, :texture, :string
    add_column :fruits, :label, :string
  end
end
