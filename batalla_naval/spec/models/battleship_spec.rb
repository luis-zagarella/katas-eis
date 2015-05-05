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
          expect(small.occupied_points).to eq ([@origin])
	end

  end

  describe 'Point class logic' do

	before (:each) do
	  @point = Point.new 3,3
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
