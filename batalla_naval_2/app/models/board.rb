class Board

  def initialize(a_width, a_long)
    @width = a_width
    @long = a_long
    @ships = []
  end
 
  def width
    @width
  end

  def long
    @long
  end

  def ships
    @ships
  end 

  def set_ships(fleet)
    @ships = fleet
  end
  
  # adding a new ship to the fleet checking out of board problems 
  def add_a_ship_to_fleet(a_size, a_origin, a_direction)
    new_ship = Ship.new(a_size, a_origin, a_direction)
    new_ship.check_is_out_of_board(width, long)
    add_ship(new_ship)
  end

  # add a ship to ships 
  def add_ship(a_ship)
    res = [a_ship]
    if(ships.size > 0)
      ships = ships + res
    else
      set_ships(res)
    end
  end

  # returns true if a_point is empty (there isn't ships there)
  def is_empty(a_point)
    !ships.any? { |ship| ship.a_point_belongs_to_ship(a_point) }  
  end

end