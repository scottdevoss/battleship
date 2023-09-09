class Board 
attr_reader :cells
  def initialize
    @cells = {
        "A1" => Cell.new("A1"),
        "A2" => Cell.new("A2"),
        "A3" => Cell.new("A3"),
        "A4" => Cell.new("A4"),
        "B1" => Cell.new("B1"),
        "B2" => Cell.new("B2"),
        "B3" => Cell.new("B3"),
        "B4" => Cell.new("B4"),
        "C1" => Cell.new("C1"),
        "C2" => Cell.new("C2"),
        "C3" => Cell.new("C3"),
        "C4" => Cell.new("C4"),
        "D1" => Cell.new("D1"),
        "D2" => Cell.new("D2"),
        "D3" => Cell.new("D3"),
        "D4" => Cell.new("D4")
      }
  end

  def valid_coordinate?(coordinate)
    if @cells.keys.include?(coordinate)
      true
    else 
      false
    end
  end

  def valid_placement?(ship, coordinates)

    #check length of ship 
    ship_length = ship.length
    #check number of coordinates
    coordinates_length = coordinates.length
    #make sure they are both equal
    
    numbers = []
    letters = []
    coordinates.each do |cord|
      numbers << cord.chars.last.to_i
      letters << cord.chars.first
      
    end
    
    if ship_length == coordinates_length
      
      check_letters(letters)
      check_numbers(numbers)
     
      if check_letters(letters) == false || check_numbers(numbers) == false
        check_diagonal(coordinates)
      elsif check_letters(letters) == true && check_numbers(numbers) == true
        true
      end 
      
    else 
      false
    end 
  end

  def check_letters(letters)
    sorted_letters = letters.sort
    sorted_letters.uniq.count == 1 || sorted_letters.each_cons(2).all?{|a,b| b.ord - a.ord == 1} 
  end

  def check_numbers(numbers)
   
    # sorted_numbers = numbers.sort 
    numbers.each_cons(2).all?{|a,b| b - a == 1} 

  end

  def check_diagonal(coordinates)
    #if letters are different then the numbers have to be the same
    # if letters.uniq.count > 1
    #   numbers.uniq.count == 1
    # elsif numbers.uniq.count == 1
    #       letters.uniq.count > 1
    # else  
    #   true
    # end
    # letters.uniq.length > 1 && numbers.uniq.length > 1
    # letters = coordinates.map { |coordinate| coordinate[0].ord }
    # numbers = coordinates.map { |coordinate| coordinate[1..-1].to_i }
  
    # diffs = []
    # coordinates.each_with_index do |coordinate, idx|
    #   diffs << (letters[idx] - numbers[idx])
    # end
  
    # letters.uniq.length > 1 && numbers.uniq.length > 1 && diffs.uniq.length == 1


    letters = coordinates.map { |coordinate| coordinate[0].ord }
    numbers = coordinates.map { |coordinate| coordinate[1..-1].to_i }

    letters.uniq.length > 1 && numbers.uniq.length > 1


    #if the numbers are the same the letters have to be different

  end
end