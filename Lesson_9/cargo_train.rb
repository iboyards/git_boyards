class CargoTrain < Train
  attr_accessor :car

  def initialize(number, type = 'cargo')
    super
  end

  def acceptable?(car)
    car.is_a?(CargoCar)
  end
end
