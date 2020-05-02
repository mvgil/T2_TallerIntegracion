class CreateHamburguesaingredientes < ActiveRecord::Migration[5.1]
  def change
    create_table :hamburguesaingredientes do |t|
      t.integer :hamburguesa_id
      t.integer :ingrediente_id

      t.timestamps
    end
  end
end
