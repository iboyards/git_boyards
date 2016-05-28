class CargoTrain < Train

    
  def initialize(number, type = 'cargo', railcars)    
    super
  end

  def acceptable?(car)
    (car.is_a? Railcar) && car.class == CargoCar
  end 

end