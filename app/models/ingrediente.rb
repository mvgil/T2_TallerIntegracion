class Ingrediente < ApplicationRecord
	has_many :hamburguesa_ingredientes
	has_many :hamburguesas, through => :hamburguesa_ingredientes
end
