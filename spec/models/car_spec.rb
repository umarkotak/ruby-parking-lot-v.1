require 'spec_helper'

RSpec.describe Car do
  describe '#new' do
    it 'returns car' do
      car = Car.new('A-1234-BC', 'red')
      expect(car).to be_a Car
    end
  end
end
