class Train  < Route
	
	attr_reader :railcars, :number
	attr_accessor :speed, :arr_station
	
	def initialize (number, type, railcars)
		@speed = 0
		@railcars = railcars.to_i
		@arr_station = []
		@index = 0
		@i = 0
	end

	def move
		self.speed = @speed + 10
	end

	def stop
		self.speed = 0
	end

	def hook_car
		if @speed == 0
			@railcars += 1
		else
			puts "Please, stop the train"
		end
	end

	def unhook_car
		if @speed == 0 && @railcars > 1
			@railcars -= 1
		elsif @speed >0 
			puts "Please, stop the train"
		elsif @railcars == 1
			puts "It is impossible to unhook last car"
		end
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

	def now
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
end