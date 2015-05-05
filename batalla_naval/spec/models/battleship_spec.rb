require_relative '../../app/models/board.rb'
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

  end


end
