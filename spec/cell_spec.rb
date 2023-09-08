require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@cell).to be_an_instance_of(Cell)
    end
  end

  describe '#ship' do 
    it 'can have a ship or nothing' do
      expect(@cell.ship).to be nil
    end
  end

  describe '#empty?' do
    it 'can check if a ship cell is empty or not' do
      expect(@cell.empty?).to be true
      cruiser = Ship.new("Cruiser", 3)
      @cell.place_ship(cruiser)
      @cell.ship
      expect(@cell.empty?).to be false
    end
  end

end