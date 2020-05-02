class AddImagenToHamburguesa < ActiveRecord::Migration[5.1]
  def change
    add_column :hamburguesas, :imagen, :string
  end
end
