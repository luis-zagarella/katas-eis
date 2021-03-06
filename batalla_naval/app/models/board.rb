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

  # adding a new ship to the fleet checking for collisions and out of boardr problems
  def add_a_ship_to_fleet(a_size, a_origin, a_direction)
	new_ship = Ship.new(a_size, a_origin, a_direction)
	new_ship.check_is_out_of_board(width, long)
	new_ship.check_for_collisions(ships)
	add_ship(new_ship)
  end

  # add a ship to ships 
  def add_ship(a_ship)
	res = [a_ship]
	if(ships.size < 0)
		ships = ships + res
        else
		set_ships(res)
	end
  end

  # returns true if a_point is empty (there isn't ships there)
  def is_empty(a_point)
	!ships.any? { |ship| ship.a_point_belongs_to_ship(a_point) }  
  end

  # make a shoot ckecking for out of board problems
  def shoot(a_point)
  	msj = ' '
	if(a_point.is_in_range(width, long))
		msj = make_shoot(a_point)
	else
		raise 'Shoot out of board!'
	end
	msj
  end
  
  # make a valid shoot
  def make_shoot(a_point)
	msj = 'water'
	if(!is_empty(a_point))
		msj = make_damage(a_point)
	end
	msj
  end

  # make damage to the ship that is at a_point 
  def make_damage(a_point)
  	msj = 'hit'
	ship = ship_at(a_point)
	ship.get_hit(a_point)
	if(ship.state() == 'sink')
		remove_to_the_fleet(ship)
		msj = 'sink'
	end
	msj	
  end

  # returns the ship that is at a_point
  def ship_at(a_point)
	index = ships.find_index { |ship| ship.a_point_belongs_to_ship(a_point) }
	ships[index]
  end

  # removes a_ship to the fleet
  def remove_to_the_fleet(a_ship)
  	ships.reject! { |ship| ship == a_ship }
  end

end
