require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'


RSpec.describe Board do 
  before(:each) do
    @board = Board.new
  end

  describe '#initialize' do
    it 'exists'  do 
      expect(@board).to be_an_instance_of(Board)
    end
  end 

  describe 'has attributes' do
    it 'has cells for 4X4 board' do 
      expect(@board.cells.values.first).to be_an(Cell)
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells.size).to eq(16)
    end 
  end

  describe '#valid_coordinate?' do
    it 'can determine if a coordinate is valid or not' do
      @board.cells
      expect(@board.valid_coordinate?("A1")).to be true
      expect(@board.valid_coordinate?("D4")).to be true
      expect(@board.valid_coordinate?("A5")).to be false
    end
  end

  describe '#valid_placement?' do
    it 'the ship length is the same at the number of coordinates' do
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
       expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to be false
       expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
       expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
       expect(@board.valid_placement?(submarine, ["A2", "A3"])).to be true
    end

    it 'makes sure the coordinates are consecutive' do
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
      expect(@board.valid_placement?(submarine, ["A1", "C1"])).to be false
      expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
      expect(@board.valid_placement?(submarine, ["C1", "B1"])).to be false
      expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
      expect(@board.valid_placement?(submarine, ["C1", "C2"])).to be true
    end

    it 'makes sure the coordinates are not diagonal' do
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
      expect(@board.valid_placement?(submarine, ["C2", "D3"])).to be false
    end
   
    it '#valid_placement' do
      cruiser = Ship.new("Cruiser", 3)  
      submarine = Ship.new("Submarine", 2) 
      expect(@board.valid_placement?(submarine, ["A1", "A2"])).to be true
      expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
    end
  end
end 