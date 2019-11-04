require_relative 'controllers/parking_lot_controller.rb'

class Main
  def initialize(file_arg = nil)
    @file_arg = file_arg
    @parking_lot_controller = ParkingLotController.new
  end

  def start
    puts 'Parking Lot App'
    file_arg ? read_from_file : read_from_user_input
  end

  private

    attr_reader :file_arg, :parking_lot_controller

    def read_from_file
      inputs = []
      File.open(file_arg, 'r') do |f|
        f.each_line do |line|
          inputs << line
        end
      end
      puts inputs
      inputs.each do |input|
        parking_lot_controller.execute(input)
      end
    end

    def read_from_user_input
      while true
        input = gets.chomp
        parking_lot_controller.execute(input)
      end
    end
end

file_arg = ARGV.first
main = Main.new(file_arg)
main.start
