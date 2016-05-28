
class RailwayStation

  attr_accessor :name

  @@all_st = []

  TYPE_TRAIN_FORMAT = /((cargo)|(pass))/

  def self.all
    @@all_st
     #ObjectSpace.each_object(self) { |station| puts station.name }
  end

  def initialize(name)
    @name = name    
    @amount = {'cargo': 0, 'pass': 0}
    @train_list = {}  
    @@all_st << self
    validate!
  end

  def train_arrival(type, name)
    @train_list[name] = type
  	@amount[:cargo] += 1 if type == "cargo"
  	@amount[:pass] += 1 if type == "pass"
    raise "Type - 'cargo' or 'pass'"  if type !~ TYPE_TRAIN_FORMAT  
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

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Name station can't be nil" if name.nil?
    raise "Name station should be at least 3 symbols" if name.length < 3
    true
  end

end