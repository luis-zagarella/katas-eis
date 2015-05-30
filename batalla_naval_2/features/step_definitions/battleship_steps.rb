require_relative '../../app/models/board.rb'
require_relative '../../app/models/point.rb'
require_relative '../../app/models/ship.rb'

Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |width, heigth|
  @board = Board.new width.to_i, heigth.to_i
end

When(/^I create a small ship in position "(.*?)"$/) do |point|	
  a = point.split(":")
  x= a[0].to_i
  y= a[1].to_i
  @origin = Point.new(x,y)
  begin
    @board.add_a_ship_to_fleet('small', @origin,'North')
  rescue RuntimeError => @an_error	
  end
end

Then(/^position "(.*?)" is not empty$/) do |point|
  a = point.split(":")
  x= a[0].to_i
  y= a[1].to_i
  @my_point = Point.new(x,y) 
  expect(@board.is_empty(@my_point)).to eq false
end

When(/^I create a large ship in position "(.*?)"$/) do |point|
  a = point.split(":")
  x= a[0].to_i
  y= a[1].to_i
  @origin = Point.new(x,y)
  begin  	
    @board.add_a_ship_to_fleet('large', @origin,'North')
  rescue RuntimeError => @an_error
  end
end
