class CargoCar < CargoTrain


	attr_accessor :type_car

	def initialize 
		@type_car = 'cargo'
	end 		
end