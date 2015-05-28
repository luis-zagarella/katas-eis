require_relative '../../app/models/board.rb'
require_relative '../spec_helper.rb'

describe 'Board' do

  before (:each) do
    @board = Board.new 5,5
    @origin = Point.new 3,3
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
    
    it 'should add a large ship in origin and a small ship in edge' do
      @board.add_a_ship_to_fleet('large', @origin, 'North')
      @board.add_a_ship_to_fleet('small', @edge, 'North')
      expect(@board.ships.size).to eq 2
      expect(@board.is_empty(@origin)).to eq false
      expect(@board.is_empty(@origin.next_at('Norht'))).to eq false
      expect(@board.is_empty(@edge)).to eq false
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

  describe 'Making shoots' do
  
    before (:each) do
      @miss = @origin.next_at('East')
      @neighbor = Point.new 3,4
	  @board.add_a_ship_to_fleet('large', @origin, 'North')
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
