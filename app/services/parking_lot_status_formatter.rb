module ParkingLotStatusFormatter
  def status
    output = "No. \t Number Plate \t Colour \n"
    self.cars.each_with_index do |car, i|
      output += "#{i + 1} \t #{car.number_plate} \t #{car.colour} \n" if car
    end
    output
  end
end
