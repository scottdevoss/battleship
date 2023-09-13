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
      expect(@board.valid_placement?(cruiser, ["B2", "C2", "D2"])).to be true
      expect(@board.valid_placement?(submarine, ["C2", "D2"])).to be true
    end
   
    it '#valid_placement' do
      cruiser = Ship.new("Cruiser", 3)  
      submarine = Ship.new("Submarine", 2) 
      expect(@board.valid_placement?(submarine, ["A1", "A2"])).to be true
      expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
      expect(@board.valid_placement?(cruiser, ["B1", "C2", "D3"])).to be false
      expect(@board.valid_placement?(submarine, ["D1", "D1"])).to be false
    end
  end

    describe '#placing ship method'  do 
      it 'places ship on the board' do 
        cruiser = Ship.new("Cruiser", 3) 
        @board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = @board.cells["A1"] 
        cell_2 = @board.cells["A2"]
        cell_3 = @board.cells["A3"]

        expect(cell_1).to be_an(Cell)
        expect(cell_2).to be_an(Cell)
        expect(cell_3).to be_an(Cell)

        expect(cell_1.ship).to eq(cruiser)
        expect(cell_2.ship).to eq(cruiser)
        expect(cell_3.ship).to eq(cruiser)
        expect(cell_3.ship == cell_2.ship).to eq(true)
      end 
    end

    describe "overlapping ships" do
      it "cannot have #overlappig ships" do 
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)   
        @board.place(cruiser, ["A1", "A2", "A3"])
        expect(@board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
        expect(@board.valid_placement?(submarine, ["B1", "C1"])).to eq(true)
      end
    end

    describe '#render the board' do
      it 'can render the board' do
        cruiser = Ship.new("Cruiser", 3) 
        @board.place(cruiser, ["A1", "A2", "A3"])
        expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
        expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
      end
    end
end