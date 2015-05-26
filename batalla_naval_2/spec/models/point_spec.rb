require_relative '../../app/models/point.rb'
require_relative '../spec_helper.rb'

describe 'Point' do

  before (:each) do
  	@point = Point.new 3,3
  end
	
  it 'should return that are equals' do
    the_same = Point.new 3,3	  
    expect(@point.is_equal(the_same)).to eq true
  end

  it 'should return that are equals' do
    the_same = Point.new 3,3	  
    expect(@point.is_equal(the_same)).to eq true
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