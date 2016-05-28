class Train < Route

  include Vendor

  @@arr_trains = {}

  NUMBER_FORMAT = /^\w{3}(-?)\w{2}$/
  TYPE_TRAIN_FORMAT = /((cargo)|(pass))/
  RAILCARS_FORMAT = /\d*/

  def self.find(train)
    @@arr_trains[train]
  end

    
  attr_reader  :number, :railcars, :speed
  
  attr_accessor  :speed, :arr_station, :route, :type
  def initialize (number, type, railcars)
    @speed = 0
    @railcars = railcars.to_i
    @arr_station = []
    @index = 0
    @i = 0
    @info_train = {}
    @type = type
    @number = number
    @@arr_trains[@number] = self
    validate!
  end 

  def move
    self.speed += 10 
  end

  def stop
    self.speed = 0
  end

  def hook(car)
    self.railcars +=1 if speed == 0 && acceptable?(car) 
  end

  def unhook(car)
    self.railcars -=1 if speed == 0 && acceptable?(car) && self.railcars > 1
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

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Number train can't be nil" if number.nil?
    raise "Type trsin can't be nil" if type.nil?
    raise "The number of cars can't be nil" if railcars.nil?
    raise "Type - 'cargo' or 'pass'"  if type !~ TYPE_TRAIN_FORMAT
    raise "Number has invalid format"  if number !~ NUMBER_FORMAT
    #raise "Railcars has invalid format"  if railcars !~ RAILCARS_FORMAT
    raise "Number train should be at least 5 symbols" if number.length < 5
    true
  end

end