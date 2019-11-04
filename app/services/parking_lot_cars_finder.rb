module ParkingLotCarsFinder
  def find_cars_by_colour(colour)
    matched_cars = []
    self.cars.each_with_index.map do |car, index|
      if car.colour == colour
        matched_cars << { index: index, car: car }
      end
    end
    matched_cars.compact
  end

  def find_cars_by_number_plate(number_plate)
    matched_cars = []
    self.cars.each_with_index.map do |car, index|
      if car.number_plate == number_plate
        matched_cars << { index: index, car: car }
      end
    end
    matched_cars.compact
  end
end
