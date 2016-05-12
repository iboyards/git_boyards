class Route
	

	attr_accessor :routed, :i
	attr_reader :first_st, :last_st

	def initialize(first_st, last_st)
		@routed = []	
		@i = 1	
		@routed[0] = first_st 
		@last_st = last_st
		@routed[1] = last_st
    end
  
	def add(station)
		@routed[@i] = station
		@i = @routed.size 
		@routed[@i] = @last_st
	end

	def del(station)
		@routed.delete(station)
		print @routed
	end

	def list
		puts @routed
	end

end


