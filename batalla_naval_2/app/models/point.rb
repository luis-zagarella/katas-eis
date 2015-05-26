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

  # returns self is equal to another_point
  def is_equal(another_point)
    (x == another_point.x) && (y == another_point.y)	
  end

end