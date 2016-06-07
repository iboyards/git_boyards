class PassengerCar < Railcar
  attr_reader :take_places

  def initialize(seats)
    @seats = seats
    @take_places = 0
  end

  def take_place
    @take_places += 1 if @take_places < @seats
  end

  def free_places
    @free_places = @seats - @take_places
  end
end
