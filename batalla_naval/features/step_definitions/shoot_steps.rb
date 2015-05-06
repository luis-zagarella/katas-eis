require_relative '../../app/models/board.rb'
require_relative '../../app/models/point.rb'
require_relative '../../app/models/ship.rb'

Given(/^a medium ship in position: “(\d+):(\d+)”$/) do |x, y|
  @origin = Point.new(x.to_i,y.to_i)
  @board.add_a_ship_to_fleet('medium', @origin,'North')
end

When(/^I shoot to position “(\d+):(\d+)”$/) do |x, y|
  begin
    @response = @board.shoot(Point.new(x.to_i,y.to_i))
  rescue RuntimeError => @an_error
  end
end

Then(/^I get hit$/) do
  expect(@response).to eq 'hit'
end

Then(/^I get water$/) do
  expect(@response).to eq 'water'
end

Then(/^I get sink$/) do
  expect(@response).to eq 'sink'
end

Then(/^it should raise error "(.*?)"$/) do |msj|
   expect{ raise @an_error }.to raise_error(msj)
end

