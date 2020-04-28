class Hamburguesa < ApplicationRecord
	has_many :hamburguesa_ingredientes
	has_many :ingredientes, :through => :hamburguesa_ingredientes
end
