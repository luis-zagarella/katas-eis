require_relative '../../app/models/board.rb'
require_relative '../../app/models/point.rb'
require_relative '../../app/models/ship.rb'

Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |width, long|
  @board = Board.new width.to_i, long.to_i
end

Given(/^I create a small ship in position "(.*?)"$/) do |point|	
  a = point.split(":")
  x= a[0].to_i
  y= a[1].to_i
  @origin = Point.new(x,y)
  @board.add_a_ship_to_fleet('small', @origin,'North')
end

Then(/^position "(.*?)" is not empty$/) do |point|
   b = point.split(":")
   	x1= b[0].to_i
   	y1= b[1].to_i
   @my_point = Point.new(x1,y1) 
   expect(@board.is_empty(@my_point)).to eq false
end
