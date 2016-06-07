require './modules.rb'
require './station.rb'
require './route.rb'
require './train.rb'
require './railcar.rb'
require './cargo_train.rb'
require './cargo_car.rb'
require './passenger_train.rb'
require './passenger_car.rb'

st1 = RailwayStation.new('st1')
st2 = RailwayStation.new('st2')
st3 = RailwayStation.new('st3')
st4 = RailwayStation.new('st4')

route = Route.new(st1, st4)
route.add(st2)
route.add(st3)

c1ttt = CargoTrain.new('c1ttt')
c2ttt = CargoTrain.new('c2ttt')
c3ttt = CargoTrain.new('c3ttt')
c4ttt = CargoTrain.new('c4ttt')

p1ttt = PassengerTrain.new('p1ttt')
p2ttt = PassengerTrain.new('p2ttt')
p3ttt = PassengerTrain.new('p3ttt')
p4ttt = PassengerTrain.new('p4ttt')

c1c = CargoCar.new(200)
c2c = CargoCar.new(150)
c3c = CargoCar.new(109)
c4c = CargoCar.new(300)

p1c = PassengerCar.new(10)
p2c = PassengerCar.new(20)
p3c = PassengerCar.new(30)
p4c = PassengerCar.new(50)

c4c.take_volume(50)
p1c.take_place

p1ttt.hook(p1c)
p1ttt.hook(p2c)
p1ttt.hook(p4c)
p2ttt.hook(p3c)
c3ttt.hook(c4c)
p4ttt.hook(p1c)

st1.train_arrival(p2ttt)
st2.train_arrival(p1ttt)
st1.train_arrival(c3ttt)
st3.train_arrival(p4ttt)
st4.train_arrival(c4ttt)

route.stations.each do |station|
  puts station.name
  station.trains_on_station do |trains|
    puts "#{trains.number}-#{trains.class}-wagons #{trains.wagons}"
    trains.show_wagons do |car|
      if car.class == PassengerCar
        puts "wagon №#{trains.railcars.index(car) + 1} #{car.class} - Free seats - #{car.free_places} Take seats - #{car.take_places}"
      elsif car.class == CargoCar
        puts "wagon №#{trains.railcars.index(car) + 1} #{car.class} - Free volume - #{car.free_volume?} Occupied volume - #{car.occupied_volume}"
      end
    end
  end
end
# station.trains_on_station{|trains| puts "#{station.name}<-(#{trains.number}-#{trains.class}-wagons #{trains.wagons})"}
# trains.show_wagons{|car| print "wagon №#{trains.railcars.index(car)+1} #{car.class} - Free seats - #{car.free_places
# if car.class == PassengerCar} Take seats - #{car.take_places if car.class == PassengerCar}";
# puts "#{car.volume  if car.class == CargoCar} #{car.occupied_volume if car.class == CargoCar}"
# }}
