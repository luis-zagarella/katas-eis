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

  def add_a_ship_to_fleet(a_size, a_origin, a_direction)
	new_ship = Ship.new(a_size, a_origin, a_direction)
	if(is_valid(new_ship))
		add_ship(new_ship)
	end
  end

  def add_ship(a_ship)
	res = [a_ship]
	if(ships.size < 0)
		ships = ships + res
        else
		set_ships(res)
	end
  end

  def is_valid(a_ship)
	true
  end

  def is_empty(a_point)
	!ships.any? { |ship| ship.a_point_belongs_to_ship(a_point) }  
  end

end
