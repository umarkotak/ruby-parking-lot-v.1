class Car
  attr_reader :number_plate, :colour

  def initialize(number_plate, colour)
    @number_plate = number_plate
    @colour = colour
  end
end
