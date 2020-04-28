class HamburguesaIngrediente < ApplicationRecord
	belongs_to :hamburguesas
	belongs_to :ingredientes
end
