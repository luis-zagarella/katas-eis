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
	res = 0
	if(a_size == "small")
		res = 1
	elsif(a_size == "medium")
		res = 2	
	elsif(a_size == "large")
		res = 3	
	end
	res
  end

  def generate_occupied_points(a_size, a_origin, a_direction)
	occupied  = [a_origin]	
	neighbor = a_origin
	(a_size - 1).times do 
		neighbor = neighbor.next_at(a_direction)
  		occupied = occupied + [neighbor]
	end	
	set_occupied_points(occupied)  
  end

  def a_point_belongs_to_ship(a_point)
	occupied_points.any? { |point| point.is_equal(a_point) } 
  end

  def get_hit(a_point)
	occupied_points.reject! { |point| point.is_equal(a_point) }
	set_state('damage') 
	check_if_is_sink()
  end

  def check_if_is_sink
	if(occupied_points.size == 0)
		set_state('sink')
	end
  end
end
