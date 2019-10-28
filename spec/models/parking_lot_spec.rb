require 'spec_helper'

RSpec.describe ParkingLot do
  describe '#new' do
    it 'returns parking lot' do
      parking_lot = ParkingLot.new(5)
      expect(parking_lot).to be_a ParkingLot
    end
  end

  describe '#park' do
    let(:size) { 2 }
    let(:parking_lot) { ParkingLot.new(size) }
    let(:car) { Car.new('A-1234-BC', 'red') }
    context 'success' do
      it 'parks car' do
        parking_lot.park(car)
      end
    end

    context 'failsed' do

    end
  end
end
