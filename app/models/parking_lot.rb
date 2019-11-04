require_relative '../services/parking_lot_status_formatter.rb'
require_relative '../services/parking_lot_cars_finder.rb'

class ParkingLot
  include ParkingLotStatusFormatter
  include ParkingLotCarsFinder

  ERROR_PARKING_LOT_FULL = 'Sorry, parking lot is full'.freeze
  ERROR_INVALID_SLOT = 'Sorry, the slot number is invalid'.freeze

  attr_reader :size, :cars, :empty_slot_index

  def initialize(size)
    @size = size
    @cars = Array.new(size)
    @empty_slot_index = 0
  end

  def park(car)
    raise ERROR_PARKING_LOT_FULL if cars.index(nil) == nil
    slot_index = empty_slot_index
    cars[slot_index] = car
    @empty_slot_index = cars.index(nil)
    slot_index
  end

  def leave(slot_no)
    raise ERROR_INVALID_SLOT if slot_no <= 0 || slot_no > size
    slot_index = slot_no - 1
    cars[slot_index] = nil
    @empty_slot_index = cars.index(nil)
    slot_index
  end
end
