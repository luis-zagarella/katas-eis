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
	1
  end

  # build the parts of a ship
  def generate_occupied_points(a_size, a_origin, a_direction)
	occupied  = [a_origin]	
	set_occupied_points(occupied)  
  end

end