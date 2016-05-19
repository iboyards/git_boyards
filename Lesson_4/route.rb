class Route 
	attr_accessor :stations, :i
	attr_reader :first_st, :last_st

	def initialize(first_st, last_st)
		@stations = []	
		@i = -2
		@stations << first_st << last_st
	end
  
  private # не используется в подклассах
	def add(station)
		@stations.insert(@i,station)
	end

	def del(station)
		@stations.delete(station)
		print @stations
	end
end


