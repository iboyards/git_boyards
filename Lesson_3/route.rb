class Route
	@@i = 1

	attr_accessor :routed
	attr_reader :first_st, :last_st

	def initialize(first_st, last_st)
		@@routed = []		
		@@routed[0] = first_st 
		@last_st = last_st
  end
  
	def add(station)
		@@routed[@@i] = station
		@@i = @@routed.size 
		@@routed[@@i] = @last_st
	end

	def del(station)
		@@routed.delete(station)
		print @routed
	end

	def list
		puts @routed
	end

end


