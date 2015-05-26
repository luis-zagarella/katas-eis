require_relative '../../app/models/board.rb'
require_relative '../../app/models/ship.rb'
require_relative '../../app/models/point.rb'

Given(/^a large ship in position: “(\d+):(\d+)”$/) do |x, y|
  @origin = Point.new(x.to_i,y.to_i)
  @board.add_a_ship_to_fleet('large', @origin,'North')
end

When(/^I shoot to position “(\d+):(\d+)”$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I get hit$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I get water$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I shoot to position “(\d+):(\d+)”$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I get sink$/) do
  pending # express the regexp above with the code you wish you had
end