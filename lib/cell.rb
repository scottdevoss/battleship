class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @fired_upon == false
      @fired_upon = true
      @ship.hit if !empty?
    end
  end

  def render
    if fired_upon? == false
      "."
    elsif fired_upon? == true && empty?
      "M"
    end
  end
end