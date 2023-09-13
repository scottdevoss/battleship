class Game
  attr_reader :human_cruiser, :human_submarine, :robo_cruiser, :robo_submarine, :human_board, :robo_board
  def initialize
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @robo_cruiser = Ship.new("Cruiser", 3)
    @robo_submarine = Ship.new("Submarine", 2)
    @human_board = Board.new
    @robo_board = Board.new
  end
  #main menu
  def main_menu
    "Welcome to BATTLESHIP\n Enter p to play. Enter q to quit."
  end
  #Setup
  def start_game
    puts main_menu
    loop do 
      input = gets.chomp
      if input == "p" 
        robo_place_ship
        display_boards
        human_place_ship(human_cruiser)
        human_place_ship(human_submarine)
        human_shoot(coordinate)
      elsif input == "q"
        puts "See you later"     
      else
        puts "I don't understand. Enter p or q"
      end
    end
  end
  #computer ship placement
  def get_random_coordinates(size, ship)
    random_cords = @robo_board.cells.keys.sample(size)
    until @robo_board.valid_placement?(ship, random_cords)
      random_cords = @robo_board.cells.keys.sample(size)
    end 
    random_cords
  end


  def robo_place_ship
    cords = get_random_coordinates(3, @robo_cruiser)
    @robo_board.place(@robo_cruiser, cords)
    cords = get_random_coordinates(2, @robo_submarine)
    @robo_board.place(@robo_submarine, cords)
    print 'My ships are now on my board'
  end
  #player ship placement
  def human_place_ship(ship)
    print "You now need to lay out your two ships.
The Cruiser is three units long and the Submarine is two units long.
  1 2 3 4
A . . . .
B . . . .
C . . . .
D . . . .
Enter the squares for the Cruiser (3 spaces):"
loop do
  human_input = gets.chomp.upcase.split(" ")
  if @human_board.valid_placement?(ship, human_input)
    @human_board.place(ship, human_input)
        break
      else
        puts "Try again with valid coordinates:\n "
      end
    end  
    puts @human_board.render(true)
    @human_board.render(true)
  end

  #taking turns

  #displaying the board
  def display_boards
    "=============ROBO BOARD=============\n" + 
    "#{@robo_board.render}\n" +
    "=============HUMAN BOARD=============\n" +
    "#{@human_board.render(reveal_ship = true)}"
  end
  #player shot
  def human_shoot(coordinate)
    puts "Enter the squares for the Submarine(2 spaces):"
    if @robo_board.include?(coordinate) && robo.valid_coordinate?(coordinate)
        return "hit"
      elsif !@robo_board.include?(coordinate) && robo.valid_coordinate?(coordinate)
        return "you already shot there, try again!"
      else  
       return "try again"
    end
  end
  #computer shot
  def robo_shoot
    
  end
  #coordinates that have already been fired upon
  #end game

  # def game_over?
  #   if @human_cruiser.sunk? && @human_submarine.sunk?
  #     true
  #   elsif @robo_cruiser.sunk? && @robo_submarine.sunk?
  #     true
  #   else
  #     false
  #   end
  # end

end

  