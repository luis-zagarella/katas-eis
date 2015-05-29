require_relative '../../app/models/board.rb'
require_relative '../../app/models/ship.rb'
require_relative '../../app/models/point.rb'

Given(/^a large ship in position: “(\d+):(\d+)”$/) do |x, y|
  fill_in :x_large, :with => x
  fill_in :y_large, :with => y
  click_button 'create_large'
end

When(/^I shoot to position “(\d+):(\d+)”$/) do |x, y|
  #pending
end

Then(/^I get hit$/) do
#pending
end

Then(/^I get water$/) do
  #pending
end

Then(/^I get sink$/) do
  #pending
end