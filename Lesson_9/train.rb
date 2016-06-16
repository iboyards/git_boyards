require './route.rb'
require './modules.rb'
require './acessors.rb'
require './validation.rb'

class Train < Route
  include Vendor  
  include Validation

  @@arr_trains = {}

  NUMBER_FORMAT = /^\w{3}(-?)\w{2}$/
  TYPE_TRAIN_FORMAT = /((cargo)|(pass))/
  RAILCARS_FORMAT = /\d*/

  

  attr_reader :number
  attr_accessor :speed, :arr_station, :route, :railcars, :type, :wagons

  def self.find(train)
    @@arr_trains[train]
  end
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :type, :v_type, String
  def initialize(number, type)
    @speed = 0
    @railcars = []
    @arr_station = []
    @wagons = 0
    @index = 0
    @i = 0
    @info_train = {}
    @type = type
    @number = number
    validate!
    @@arr_trains[number] = self
  end

  def move
    self.speed += 10
  end

  def stop
    self.speed = 0
  end

  def hook(car)
    ((railcars << car) && (@wagons += 1)) if speed == 0 && acceptable?(car)
  end

  def unhook(car)
    self.railcars -= 1 if speed == 0 && acceptable?(car) && railcars > 1
  end

  def get_route=(route)
    @arr_station = route.instance_variable_get('@stations')
    @i = @arr_station.size - 1
    puts @arr_station
  end

  def run_to
    @index += 1 if @index < @i
    print @arr_station[@index]
    puts ' - end station, reverse direction' if @index == @i
  end

  def run_back
    @index -= 1 if @index > 0
    print @arr_station[@index]
    puts ' - end station, reverse direction' if @index == 0
  end

  def position
    if (@index + 1) > @i
      puts "The next station - #{@arr_station[@index - 1]}"
    else
      puts 'The current station is the last'
    end
    puts "The current station - #{@arr_station[@index]}"
    if (@index + 1) < @i
      puts "The next station - #{@arr_station[@index + 1]}"
    else
      puts 'The current station is the last'
    end
  end

  def info
    @info_train[@number] = { type: @type, wagons: @wagons }
    puts @info_train
  end

  def show_wagons
    @railcars.each { |wagon| yield wagon }
  end

  #def valid?
   # validate!
  #rescue
   # false
  #end
=begin
  protected

  def validate!
    raise "Number train can't be nil" if number.nil?
    raise "Type train can't be nil" if type.nil?
    raise "Type - 'cargo' or 'pass'" if type !~ TYPE_TRAIN_FORMAT
    raise 'Number has invalid format' if number !~ NUMBER_FORMAT
    raise 'Number train should be at least 5 symbols' if number.length < 5
    true
  end
=end
end
