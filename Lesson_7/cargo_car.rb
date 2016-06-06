class CargoCar < Railcar

  attr_reader :occupied_volume, :volume
  
  def initialize (volume)
    @volume = volume
    @occupied_volume = 0
  end

  def take_volume(v)
    @occupied_volume +=v if @occupied_volume < @volume 
  end

  def free_volume?
    @free_volume = @volume - @occupied_volume
  end
	
end