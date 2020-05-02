module IngredientesHelper
	def is_not_number? string
		false if Integer(string) rescue true
	end
end
