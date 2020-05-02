class AddPathToHamburguesaingrediente < ActiveRecord::Migration[5.1]
  def change
    add_column :hamburguesaingredientes, :path, :string
  end
end
