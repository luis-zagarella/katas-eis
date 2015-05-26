require_relative '../../app/models/board.rb'
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

end
