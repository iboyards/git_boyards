require "./modules.rb"
require "./route.rb"
require "./train.rb"

class Menu

  attr_reader :number, :type, :railcars

  def initialize
    @number = number
    @type = type
    @railcars = railcars
  end

  def make_train
    puts "Введите номер поезда"
    @number = gets.chomp
    puts "Введите тип поезда"
    @type = gets.chomp
    puts "Введите количество вагонов в поезде"
    @railcars = gets
  end 
end


attempt = 0
begin
menu = Menu.new
menu.make_train
train = Train.new(menu.number,menu.type,menu.railcars)
train.info
#puts train.valid?
rescue Exception => e
  attempt += 1
  puts "Exception #{e.message}"
  retry if attempt < 5
ensure
  puts "There was #{attempt} attempts"
end