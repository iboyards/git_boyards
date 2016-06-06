class Train < Route

  include Vendor

  @@arr_trains = {}

  NUMBER_FORMAT = /^\w{3}(-?)\w{2}$/
  TYPE_TRAIN_FORMAT = /((cargo)|(pass))/
  RAILCARS_FORMAT = /\d*/

  def self.find(train)
    @@arr_trains[train]
  end

    
  attr_reader  :number, :speed, :railcars, :number, :wagons
  
  attr_accessor  :speed, :arr_station, :route, :railcars, :type, :wagons
  def initialize (number, type)
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

  def move #движение поезда
    self.speed += 10 
  end

  def stop #остановка поезда
    self.speed = 0
  end

  def hook(car) #прицепить вагон
     ((self.railcars << car) && (@wagons +=1)) if speed == 0 && acceptable?(car) 
  end

  def unhook(car) #отцепить вагон
    self.railcars -=1 if speed == 0 && acceptable?(car) && self.railcars > 1
  end

  def get_route=(route) #задание маршрута следования
    @arr_station = route.instance_variable_get('@stations')
    @i = @arr_station.size - 1
    puts @arr_station
  end
  
  def run_to #движение по маршруту вперед
    @index +=1 if @index < @i   
    print @arr_station[@index]
    puts ' - end station, reverse direction' if @index == @i
  end

  def run_back #движение по маршруту назад
    @index -=1 if @index > 0    
    print @arr_station[@index]
    puts ' - end station, reverse direction' if @index == 0
  end

  def position #текущее положение поезда
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

  def info #информация о поезде имя-тип-количество вагонов
    @info_train[@number] = {type: @type, wagons: @wagons}
    puts @info_train
  end

  def show_wagons(&block) #проходит по всем поездам и передаёт каждый вагон в блок
    @railcars.each{|wagon| yield wagon}    
  end

  def valid? #проверка валидности объекта
    validate!
  rescue
    false
  end

  protected

  def validate! #блок исключений
    raise "Number train can't be nil" if number.nil?
    raise "Type trsin can't be nil" if type.nil?
    #raise "The number of cars can't be nil" if railcars.nil?
    raise "Type - 'cargo' or 'pass'"  if type !~ TYPE_TRAIN_FORMAT
    raise "Number has invalid format"  if number !~ NUMBER_FORMAT
    #raise "Railcars has invalid format"  if railcars !~ RAILCARS_FORMAT
    raise "Number train should be at least 5 symbols" if number.length < 5
    true
  end

end