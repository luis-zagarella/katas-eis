require_relative '../../app/models/board.rb'
require_relative '../../app/models/ship.rb'
require_relative '../../app/models/point.rb'
require_relative '../spec_helper.rb'

describe 'Battleship' do
  
  describe 'Board initialize' do
	
  	before (:each) do
    	  @board = Board.new 5,5
  	end

  	it 'create a Board' do
    	  expect(@board.kind_of? Board).to eq true
  	end

  	it 'should create a 5x5 Board' do
    	  expect(@board.width).to eq 5
    	  expect(@board.long).to eq 5
  	end
  
  end

  describe 'Ship initialize' do

	before (:each) do
	  @origin = Point.new 3,3
	end	 
	
	it 'should create a small ship in origin' do
	  small = Ship.new 'small', @origin, 'North'
	  expect(small.state).to eq 'without damage'
	  expect(small.size).to eq 1
          expect(small.direction).to eq 'North'
          expect(small.occupied_points).to eq [@origin]
	end

	it 'should create a medium ship in origin' do
	  medium = Ship.new 'medium', @origin, 'North'
	  neighbor = @origin.next_at('North')
	  expect(medium.state).to eq 'without damage'
	  expect(medium.size).to eq 2
          expect(medium.direction).to eq 'North'
	  expect(medium.occupied_points.size).to eq 2
          expect(medium.occupied_points[0].is_equal(@origin)).to eq true
	  expect(medium.occupied_points[1].is_equal(neighbor)).to eq true
	end

	it 'should create a large ship in origin' do
	  large = Ship.new 'large', @origin, 'North'
	  neighbor1 = @origin.next_at('North')
	  neighbor2 = neighbor1.next_at('North') 
	  expect(large.state).to eq 'without damage'
	  expect(large.size).to eq 3
          expect(large.direction).to eq 'North'
	  expect(large.occupied_points.size).to eq 3
          expect(large.occupied_points[0].is_equal(@origin)).to eq true
	  expect(large.occupied_points[1].is_equal(neighbor1)).to eq true
	  expect(large.occupied_points[2].is_equal(neighbor2)).to eq true
	end

  end

  describe 'Adding ships to fleet' do
	
	before (:each) do
    	  @board = Board.new 5,5
	  @origin = Point.new 3,3
	  @edge = Point.new 4,4
          @large_point = Point.new 1,1
	end	 
	
	it 'should add a small ship in origin' do
          @board.add_a_ship_to_fleet('small', @origin, 'North')
	  expect(@board.ships.size).to eq 1
          expect(@board.is_empty(@origin)).to eq false
	end

        it 'should add a medium ship in origin' do
          @board.add_a_ship_to_fleet('medium', @origin, 'North')
	  expect(@board.ships.size).to eq 1
          expect(@board.is_empty(@origin)).to eq false
          expect(@board.is_empty(@origin.next_at('Norht'))).to eq false
	end

	it 'should add a large ship in large_point' do
	  neighbor1 = @large_point.next_at('Norht')
          neighbor2 = neighbor1.next_at('Norht')
          @board.add_a_ship_to_fleet('large', @large_point, 'North')
	  expect(@board.ships.size).to eq 1
          expect(@board.is_empty(@large_point)).to eq false
          expect(@board.is_empty(neighbor1)).to eq false
          expect(@board.is_empty(neighbor2)).to eq false
	end

	it 'should raise an error because ship is out of board' do
	  expect { @board.add_a_ship_to_fleet('medium', @edge, 'North') }.to raise_error("Ship is out of board!")
	end

  end

  describe 'Point class logic' do

	before (:each) do
	  @point = Point.new 3,3
	end
	
	it 'should return that are equals' do
	  the_same = Point.new 3,3	  
	  expect(@point.is_equal(the_same)).to eq true
	end
	
	it 'should return that are not equals' do
	  another = Point.new 3,4	  
	  expect(@point.is_equal(another)).to eq false
	end
	
  	it 'should return its neighbor at north' do
	  neighbor = @point.next_at('North')
	  expect(neighbor.x).to eq 3
	  expect(neighbor.y).to eq 4
	end
	
	it 'should return its neighbor at south' do
	  neighbor = @point.next_at('South')
	  expect(neighbor.x).to eq 3
	  expect(neighbor.y).to eq 2
	end

	it 'should return its neighbor at east' do
	  neighbor = @point.next_at('East')
	  expect(neighbor.x).to eq 4
	  expect(neighbor.y).to eq 3
	end

        it 'should return its neighbor at west' do
	  neighbor = @point.next_at('West')
	  expect(neighbor.x).to eq 2
	  expect(neighbor.y).to eq 3
	end

  end

  describe 'Making shoots' do

	before (:each) do
    	  @board = Board.new 5,5
	  @origin = Point.new 3,3
          @miss = @origin.next_at('East')
	  @neighbor = Point.new 3,4
	  @board.add_a_ship_to_fleet('medium', @origin, 'North')
	end
        
	it 'should make a shoot and miss' do
	  msj = @board.shoot(@miss)
	  expect(msj).to eq 'water'
	  expect(@board.ships[0].occupied_points.size).to eq 2
          expect(@board.ships[0].state).to eq 'without damage'
        end

	it 'should make a shoot and hit' do
	  msj = @board.shoot(@origin)
	  expect(msj).to eq 'hit'
	  expect(@board.ships[0].occupied_points.size).to eq 1
          expect(@board.ships[0].state).to eq 'damage'
        end

	it 'should make a shoot and sink' do
	  msj1 = @board.shoot(@origin)
	  msj2 = @board.shoot(@neighbor)
	  expect(msj1).to eq 'hit'
	  expect(msj2).to eq 'sink'
	  expect(@board.ships.size).to eq 0
        end
	
	it 'should make a shoot out of board and raise an error' do
	  expect { @board.shoot(Point.new 5,5) }.to raise_error("Shoot out of board!")
	end

  end

end
