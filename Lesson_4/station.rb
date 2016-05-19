
class RailwayStation
  attr_accessor :name

  def initialize(name)
    @name = name
    @amount = {'cargo': 0, 'pass': 0}
    @train_list = {}  
  end

  def train_arrival(type, name)
  	@train_list[name] = type
  	@amount[:cargo] += 1 if type == "cargo"
  	@amount[:pass] += 1 if type == "pass"
  end

  def train_list
  	print "At the '#{@name}' station there are trains #{@train_list.keys}" 
  end

  def train_types
  	puts "At the '#{@name}' station there are types of trains #{@amount}"
  end

  def train_departed (name)
  	@amount[:cargo] -= 1 if @train_list[name] == "cargo"
  	@amount[:pass] -= 1 if @train_list[name] == "pass"
  	@train_list.delete name
  	puts "At the '#{@name}' station there are trains #{@train_list.keys} and types of trains #{@amount}"
  end

end