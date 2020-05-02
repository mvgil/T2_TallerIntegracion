class Hamburguesa < ApplicationRecord
	has_many :hamburguesaingredientes
	has_many :ingredientes, :through => :hamburguesaingredientes
	def as_json(*args)
    	super.tap { |hash| hash["ingredientes"] = hash.delete "hamburguesaingredientes" }
	end


end
