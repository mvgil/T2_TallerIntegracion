class CreateHamburguesaIngredientes < ActiveRecord::Migration[5.1]
  def change
    create_table :hamburguesa_ingredientes do |t|
      t.integer :id_hamburguesa
      t.integer :id_ingrediente

      t.timestamps
    end
  end
end
