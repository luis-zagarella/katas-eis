require_relative '../../app/models/ship.rb'
require_relative '../spec_helper.rb'

describe 'Ship' do

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

end
