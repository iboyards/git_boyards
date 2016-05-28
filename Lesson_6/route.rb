class Route 
	attr_accessor :stations, :i
	attr_reader :first_st, :last_st

	def initialize(first_st, last_st)
		@stations = []	
    @first_st = first_st
    @last_st = last_st
		@i = -2
		@stations << first_st << last_st
    validate!
	end
  
  private # не используется в подклассах
	def add(station)
		@stations.insert(@i,station)
	end

	def del(station)
		@stations.delete(station)
		print @stations
	end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise  ArgumentError, "First or last stations can't be nil" 
    raise "First or last stations should be at least 3 symbols" if first_st.length < 3 || last_st.length < 3
    true
  end
end


