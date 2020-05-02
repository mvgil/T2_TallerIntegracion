class Ingrediente < ApplicationRecord
	has_many :hamburguesaingredientes
	has_many :hamburguesas, :through => :hamburguesaingredientes

	def path_ingrediente (path)
		return path + self.id.to_s
	end
end
