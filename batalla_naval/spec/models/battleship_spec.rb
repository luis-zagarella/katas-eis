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
    	  expect(@board.size[0]).to eq 5
    	  expect(@board.size[1]).to eq 5
  	end
  
  end

  describe 'Ship initialize' do

	before (:each) do
	  @origin = Point.new 3,3
	end	 
	
	it 'should create a small ship in origin' do
	  small = Ship.new 'small', @origin, 'North'
	  expect(small.size).to eq 1
          expect(small.direction).to eq 'North'
          expect(small.occupied_points).to eq [@origin]
	end

	it 'should create a medium ship in origin' do
	  medium = Ship.new 'medium', @origin, 'North'
	  neighbor = @origin.next_at('North')
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
	  expect(large.size).to eq 3
          expect(large.direction).to eq 'North'
	  expect(large.occupied_points.size).to eq 3
          expect(large.occupied_points[0].is_equal(@origin)).to eq true
	  expect(large.occupied_points[1].is_equal(neighbor1)).to eq true
	  expect(large.occupied_points[2].is_equal(neighbor2)).to eq true
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


end
