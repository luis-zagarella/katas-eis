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
  
  it 'should create a large ship in origin' do
    large = Ship.new 'large', @origin, 'North'
    neighbor1 = @origin.next_at('North')
    expect(large.state).to eq 'without damage'
    expect(large.size).to eq 2
    expect(large.direction).to eq 'North'
    expect(large.occupied_points.size).to eq 2
    expect(large.occupied_points[0].is_equal(@origin)).to eq true
    expect(large.occupied_points[1].is_equal(neighbor1)).to eq true
  end
  
end
