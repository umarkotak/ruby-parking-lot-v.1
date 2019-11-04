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
        expect(parking_lot.cars.first).to eq car
      end
    end

    context 'failed' do
      context 'parking lot is full' do
        it 'raise Parking lot is full' do
          parking_lot.park(car)
          parking_lot.park(car)
          expect { parking_lot.park(car) }.to raise_error ParkingLot::ERROR_PARKING_LOT_FULL
        end
      end
    end
  end

  describe '#leave' do
    let(:size) { 2 }
    let(:parking_lot) { ParkingLot.new(size) }
    let(:car) { Car.new('A-1234-BC', 'red') }

    context 'success' do
      it 'removes car' do
        parking_lot.park(car)
        parking_lot.leave(1)
        expect(parking_lot.cars.first).to eq nil
      end
    end
  end
end
