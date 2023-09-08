require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@cruiser).to be_an_instance_of(Ship)
    end
  end

  describe '#sunk?' do
    it 'can determine if a ship is sunk or not' do
      expect(@cruiser.sunk?).to be false

      @cruiser.hit
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to be true
    end
  end

  describe '#hit' do
    it 'can hit and damage a ship' do
      @cruiser.hit
      expect(@cruiser.health).to eq(2)
    end
  end
end