require_relative './base_model.rb'

class ParkingLot < BaseModel
  attr_reader :size, :cars, :empty_index

  def initialize(size)
    @size = size
    @cars = Array.new(size)
    @empty_index = 0
  end

  def park(car)
    raise Errors::ParkingLotFull
    cars[empty_index] = car
  end

  def leave(slot_no)
    cars[slot_no] = nil
    @empty_index = cars.index(nil)
  end
end
