class Point
  
  def initialize(x,y)
    	@x = x
    	@y = y
  end

  def x 
	@x
  end

  def y
	@y
  end

  def set_y(a_y)
	@y = a_y
  end
	
  def set_x(a_x)
	@x = a_x
  end

  def next_at(a_direction)
	res = Point.new(x, y)  
	if(a_direction == "North")
		res.set_y(res.y() + 1)
	elsif(a_direction == "South")
		res.set_y(res.y() - 1)
	elsif(a_direction == "East")
		res.set_x(res.x() + 1)
	end
	res
  end

end
