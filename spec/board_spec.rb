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
end 