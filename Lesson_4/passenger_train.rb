class PassengerTrain < Train

	
	def initialize(number, type = 'pass', railcars)		
		super
	end

	def acceptable?(car)
    car_type =
    case self.type
    	when "pass"
    		PassengerCar
    	else
    		Railcar
    	end
    car.class == car_type
    end	
end