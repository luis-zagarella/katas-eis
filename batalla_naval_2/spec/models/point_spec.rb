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

end