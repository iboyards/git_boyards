class CargoTrain < Train
  
  attr_accessor :car

    
  def initialize(number, type = 'cargo')    
    super
    @@arr_trains[number] = self
  end

  def acceptable?(car)
    #@car.class == CargoCar
    car.is_a?(CargoCar)
  end 

end