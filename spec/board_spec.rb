require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'


RSpec.describe Board do 
  before(:each) do
    @board = Board.new
  end

  it 'exists'  do 
    expect(@board).to be_an_instance_of(Board)
  end

  it 'has cells for 4X4 board' do 
    expect(@board.cells.values.first).to be_an(Cell)
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.size).to eq(16)
  end 
end
