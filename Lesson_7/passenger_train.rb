class PassengerTrain < Train

  
  def initialize(number, type = 'pass')   
    super
  end

  def acceptable?(car)
      (car.is_a? Railcar) && (car.class == PassengerCar)
    end 
end