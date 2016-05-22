class Train < Route
	
	attr_reader  :number, :railcars, :speed, :arr_station, :arr_trains, :type
	#attr_accessor :railcars, :speed, :arr_station, :arr_trains, :type, :route
	def initialize (number, type, railcars)
		@speed = 0
		@railcars = railcars
		@arr_station = []
		@index = 0
		@i = 0
		@info_train = {}
		@type = type
		@number = number
	end	

	def move
		self.speed = @speed + 10
	end

	def stop
		self.speed = 0
	end

	def hook(car)
		self.railcars +=1 if speed == 0 && acceptable?(car)
	end

	def unhook(car)
		self.railcars -=1 if speed == 0 && acceptable?(car)
	end

	def get_route=(route)
		@arr_station = route.instance_variable_get('@stations')
		@i = @arr_station.size - 1
		puts @arr_station
	end
	
	def run_to 
		@index +=1 if @index < @i		
		print @arr_station[@index]
		puts ' - end station, reverse direction' if @index == @i
	end

	def run_back 
		@index -=1 if @index > 0		
		print @arr_station[@index]
		puts ' - end station, reverse direction' if @index == 0
	end

	def position 
		if (@index+1) > @i
			puts "The next station - #{@arr_station[@index-1]}"
		else
			puts "The current station is the last" 
		end
		puts "The current station - #{@arr_station[@index]}"
		if (@index+1) < @i
			puts "The next station - #{@arr_station[@index+1]}"
		else
			puts "The current station is the last" 
		end		
	end

	def info
		@info_train[@number] = {type: @type, wagons: @railcars}
		puts @info_train
	end

	protected

	def acceptable?(car)
    car_type =
      case self.type
      when "cargo"
        CargoCar
      when "pass"
        PassengerCar
      else
        Car
      end
    car.class == car_type
    end	
end