class CargoTrain < Train

		
	def initialize(number, type = 'cargo', railcars)		
		super
	end

	def acceptable?(car)
    car_type = 
    case self.type
    	when "cargo"
    		CargoCar
    	else
    		Railcar
    	end
    car.class == car_type
  end	

end