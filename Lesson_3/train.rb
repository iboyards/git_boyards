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

	
	def hook_unhook (action)
		if @speed == 0
			@railcars += 1 if action == 'hook'						
			@railcars -=1 if action == 'unhook'	
			puts @railcars		
		else
			puts "Please, stop the train"
		end	
	end

	def get_route=(rout)
		@arr_station = rout.instance_variable_get('@routed')
		@i = @arr_station.size - 1
		puts @arr_station
	end

	def run (direction)
		@index +=1 if direction == 'to' && @index < @i		
		@index -=1 if direction == 'back' && @index > 0	
		puts @arr_station[@index]
		puts ' - end station, reverse direction' if @index == @i || @index == 0
	end

	def now
		puts "The previous station - #{@arr_station[@index-1]}"
		puts "The current station - #{@arr_station[@index]}"
		puts "The next station - #{@arr_station[@index+1]}"
	end
end