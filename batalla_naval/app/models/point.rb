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

  def next_at(a_direction)
	res = Point.new(x, y)  
	if(a_direction == "North")
		res.set_y(res.y() + 1)
	end
	res
  end

end
