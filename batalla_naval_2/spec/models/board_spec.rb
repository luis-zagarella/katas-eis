require_relative '../../app/models/board.rb'
require_relative '../spec_helper.rb'

describe 'Board' do

  before (:each) do
    @board = Board.new 5,5
  end

  describe 'Board initialize' do

  	it 'create a Board' do
      expect(@board.kind_of? Board).to eq true
  	end

  	it 'should create a 5x5 Board' do
      expect(@board.width).to eq 5
      expect(@board.long).to eq 5
  	end
	
  end

  describe 'Adding ships to fleet' do
	
	before (:each) do
      @origin = Point.new 3,3
      @out_point = Point.new 5,5
      @edge = Point.new 4,4
      @south_origin = Point.new 3,2
    end	 
	
    it 'should add a small ship in origin' do
      @board.add_a_ship_to_fleet('small', @origin, 'North')
      expect(@board.ships.size).to eq 1
      expect(@board.is_empty(@origin)).to eq false
    end

    it 'should add a large ship in origin' do
      @board.add_a_ship_to_fleet('large', @origin, 'North')
      expect(@board.ships.size).to eq 1
      expect(@board.is_empty(@origin)).to eq false
      expect(@board.is_empty(@origin.next_at('Norht'))).to eq false
    end
    
    it 'should raise an error because ship is out of board - case small ship' do
      expect { @board.add_a_ship_to_fleet('small', @out_point, 'North') }.to raise_error("Ship is out of board!")
    end

    it 'should raise an error because ship is out of board - case large ship' do
      expect { @board.add_a_ship_to_fleet('large', @edge, 'North') }.to raise_error("Ship is out of board!")
    end

    it 'should raise an error because another ship is in the area' do
      @board.add_a_ship_to_fleet('small', @origin, 'North')
      expect { @board.add_a_ship_to_fleet('large', @south_origin, 'North') }.to raise_error("Another ship is in this area!")
	end

  end

end
