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
      cruiser = Ship.new("Cruiser", 3)
      @cell.place_ship(cruiser)
      expect(@cell.ship).to eq(cruiser)
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

  describe '#place_ship' do
    it 'can place a ship' do
      cruiser = Ship.new("Cruiser", 3)
      expect(@cell.place_ship(cruiser)).to eq (cruiser)
    end
  end

  describe '#fired_upon? and #fire_upon' do
    it 'can determine if a ship has been fired upon or not' do
      cruiser = Ship.new("Cruiser", 3)
      @cell.place_ship(cruiser)
      expect(@cell.fired_upon?).to be false
      @cell.fire_upon
      expect(@cell.fired_upon?).to be true
    end

    it 'can damage a ship that is fired upon' do
      cruiser = Ship.new("Cruiser", 3)
      @cell.place_ship(cruiser)
      expect(@cell.fired_upon?).to be false
      @cell.fire_upon
      expect(@cell.ship.health).to eq(2)
      expect(@cell.fired_upon?).to be true
    end
  end
end