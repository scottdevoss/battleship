require 'rspec'
require './lib/ship'

RSpec.describe Ship do

  describe '#initialize' do
    it 'can initialize' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser).to be_an_instance_of(Ship)
    end
  end

  describe '#sunk?' do
    it 'can determine if a ship is sunk or not' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.sunk?). to be false
    end
  end

  describe '#hit' do
    it 'can hit and damage a ship' do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
      expect(cruiser.health).to eq(2)
    end
  end

end