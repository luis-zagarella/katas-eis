class Ship

  def initialize(a_size, a_origin, a_direction)
    @size = calculate_size(a_size)
    @direction = a_direction
    @occupied_points = generate_occupied_points(calculate_size(a_size), a_origin, a_direction)
    @state = 'without damage'
  end

  def size 
    @size
  end

  def state 
  	@state
  end

  def set_state(a_state)
    @state = a_state
  end

  def direction
  	@direction
  end
 
  def occupied_points
  	@occupied_points
  end

  def set_occupied_points(points)
    @occupied_points = points
  end

  def calculate_size(a_size)
	res = 1
    if(a_size == "large")
      res = 2
    end
    res
  end

  # build the parts of a ship
  def generate_occupied_points(a_size, a_origin, a_direction)
	occupied  = [a_origin]	
	neighbor = a_origin
    (a_size - 1).times do 
      neighbor = neighbor.next_at(a_direction)
      occupied = occupied + [neighbor]
    end	
    set_occupied_points(occupied)  
  end

  # returns a_point belongs to self
  def a_point_belongs_to_ship(a_point)
    occupied_points.any? { |point| point.is_equal(a_point) } 
  end

  # check if any part of the ship is out of board
  def check_is_out_of_board(a_width, a_long)
    if(occupied_points.any? { |point| !point.is_in_range(a_width, a_long) })
      raise 'Ship is out of board!'
    end
  end

  # check if any part of the ship collides with another ship
  def check_for_collisions(other_ships)
    if(occupied_points.any? { |point| other_ships.any? { |ship| ship.a_point_belongs_to_ship(point) } })
      raise 'Another ship is in this area!'
    end
  end

  # make damage at a_point to self
  def get_hit(a_point)
    occupied_points.reject! { |point| point.is_equal(a_point) }
    set_state('damage') 
  end
 
end