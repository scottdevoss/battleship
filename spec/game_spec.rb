require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe 'Game' do
  before(:each) do
    @game = Game.new
  end

  describe 'game' do
    it 'exists' do
      expect(@game).to be_an_instance_of(Game)
    end

    it 'has attributes' do
      expect(@game.human_board).to be_a(Board)
      expect(@game.robo_board).to be_a(Board)
      expect(@game.robo_cruiser).to be_a(Ship)
      expect(@game.robo_submarine).to be_a(Ship)
      expect(@game.human_cruiser).to be_a(Ship)
      expect(@game.human_submarine).to be_a(Ship)
    end
  end

  describe 'main menu' do
    it 'prints a welcome message' do
      expect(@game.main_menu).to eq("Welcome to BATTLESHIP\n Enter p to play. Enter q to quit.")
    end
  end

  describe 'setup' do
    it 'robo places ships randomly in valid locations' do
      expect(@game.robo_board.ships.empty?).to be true
      @game.robo_place_ship
      expect(@game.robo_board.ships).to eq([@game.robo_cruiser, @game.robo_submarine])
      expect{ @game.robo_place_ship }.to output('My ships are now on my board').to_stdout
    end

  end

  describe 'board display' do
    it 'renders both game boards (no robo ships revealed)' do 
      @game.robo_board.place(@game.robo_cruiser, ['A1', 'A2', 'A3'])
      @game.robo_board.place(@game.robo_submarine, ['B1', 'C1'])
      @game.human_board.place(@game.human_cruiser, ['B4', 'C4', 'D4'])
      @game.human_board.place(@game.human_submarine, ['A1', 'B1'])
      expect(@game.display_boards).to eq(
        "=============ROBO BOARD=============\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n\n=============HUMAN BOARD=============\n  1 2 3 4 \nA S . . . \nB S . . S \nC . . . S \nD . . . S \n"
      )
    end

    xit 'boards are updated after a turn' do 
      @game.robo_board.place(@game.robo_cruiser, ['A1', 'A2', 'A3'])
      @game.robo_board.place(@game.robo_submarine, ['B1', 'C1'])
      @game.human_board.place(@game.human_cruiser, ['B4', 'C4', 'D4'])
      @game.human_board.place(@game.human_submarine, ['A1', 'B1'])
      expect(@game.display_boards).to eq(
        "=============ROBO BOARD=============\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n\n=============HUMAN BOARD=============\n  1 2 3 4 \nA S . . . \nB S . . S \nC . . . S \nD . . . S \n"
      )
      
      @game.human_shoot('A2') 
      @game.human_board.cells['B1'].fire_upon
      expect(@game.display_boards).to eq(
        "=============ROBO BOARD=============\n  1 2 3 4 \nA . H . . \nB . . . . \nC . . . . \nD . . . . \n\n=============HUMAN BOARD=============\n  1 2 3 4 \nA S . . . \nB S . . S \nC . . . S \nD . . . S \n"
      )
    end
  end
end
  
