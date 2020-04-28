class CreateHamburguesas < ActiveRecord::Migration[5.1]
  def change
    create_table :hamburguesas do |t|
      t.string :nombre
      t.integer :precio
      t.text :descripcion

      t.timestamps
    end
  end
end
