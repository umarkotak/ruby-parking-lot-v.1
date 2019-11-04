require_relative '../models/car.rb'
require_relative '../models/parking_lot.rb'
require_relative '../services/parking_lot_status_formatter.rb'

CREATE_PARKING_LOT = 'create_parking_lot'.freeze
PARK = 'park'.freeze
LEAVE = 'leave'.freeze
STATUS = 'status'.freeze
REGISTRATION_NUMBERS_FOR_CARS_WITH_COLOUR = 'registration_numbers_for_cars_with_colour'.freeze
SLOT_NUMBERS_FOR_CARS_WITH_COLOUR = 'slot_numbers_for_cars_with_colour'.freeze
SLOT_NUMBER_FOR_REGISTRATION_NUMBER = 'slot_number_for_registration_number'.freeze
EXIT = 'exit'.freeze

class ParkingLotController
  def initialize
  end

  def execute(input)
    input = input.split(' ')
    command = input.first
    params = input[1..-1]

    begin
      result = parse_command(command, params)
      puts result
    rescue StandardError => e
      puts e.message
    end
  end

  private
    attr_reader :parking_lot

    def parse_command(command, params)
      case command
      when CREATE_PARKING_LOT
        create_parking_lot(params)
      when PARK
        park(params)
      when LEAVE
        leave(params)
      when STATUS
        parking_lot.status
      when REGISTRATION_NUMBERS_FOR_CARS_WITH_COLOUR
        registration_numbers_for_cars_with_colour(params)
      when SLOT_NUMBERS_FOR_CARS_WITH_COLOUR
        slot_numbers_for_cars_with_colour(params)
      when SLOT_NUMBER_FOR_REGISTRATION_NUMBER
        slot_number_for_registration_number(params)
      when EXIT
        exit
      else
        'Invalid command'
      end
    end

    def create_parking_lot(params)
      size = params[0].to_i
      @parking_lot = ParkingLot.new(size)
      "Created a parking lot with #{size} slots"
    end

    def park(params)
      number_plate = params[0]
      colour = params[1]
      car = Car.new(number_plate, colour)
      slot_index = parking_lot.park(car)
      "Allocated slot number: #{slot_index + 1}"
    end

    def leave(params)
      slot_no = params[0].to_i
      slot_index = parking_lot.leave(slot_no)
      "Slot number #{slot_index} is free"
    end

    def status
      ParkingLotStatusFormatter.new(parking_lot).call
    end

    def registration_numbers_for_cars_with_colour(params)
      colour = params[0]
      matched_slots = parking_lot.find_cars_by_colour(colour)
      return 'Not found' if matched_slots.empty?
      return matched_slots.map { |slot| slot[:car].number_plate }.join(', ')
    end

    def slot_numbers_for_cars_with_colour(params)
      colour = params[0]
      matched_slots = parking_lot.find_cars_by_colour(colour)
      return 'Not found' if matched_slots.empty?
      return matched_slots.map { |slot| slot[:index] + 1 }.join(', ')
    end

    def slot_number_for_registration_number(params)
      number_plate = params[0]
      matched_slots = parking_lot.find_cars_by_number_plate(number_plate)
      return 'Not found' if matched_slots.empty?
      return matched_slots.map { |slot| slot[:index] + 1 }.join(', ')
    end
end
