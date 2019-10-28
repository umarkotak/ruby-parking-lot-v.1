require_relative './base_model.rb'

class Car < BaseModel
  attr_reader :number_plate, :colour

  def initialize(number_plate, colour)
    @number_plate = number_plate
    @colour = colour
  end
end
