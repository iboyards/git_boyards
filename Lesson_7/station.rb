
class RailwayStation

  attr_accessor :name, :amount

  @@all_st = []


  TYPE_TRAIN_FORMAT = /((cargo)|(pass))/

  def self.all
    @@all_st
     #ObjectSpace.each_object(self) { |station| puts station.name }
  end

  def initialize(name)
    @name = name   
    @amount = {'cargo': 0, 'pass': 0}
    @train_list = []
    validate! 
    @@all_st << self    
  end


  def train_arrival(train)    
    @train_list << train
    @amount[:cargo] += 1 if train.class == CargoTrain
    @amount[:pass] += 1 if train.class == PassengerTrain     
  end

  def train_list
  	print "At the '#{@name}' station there are trains #{@train_list.keys}" 
    #puts @train_list
  end

  def train_types
  	puts "At the '#{@name}' station there are types of trains #{@amount}"
  end

  def train_departed (train)
    @train_list.delete train
    @amount[:cargo] -= 1 if train.class == CargoTrain
    @amount[:pass] -= 1 if train.class == PassengerTrain
  end

  def trains_on_station(&block)     
      @train_list.each{|x| yield x}      
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