require_relative '../../app/models/board.rb'
require_relative '../../app/models/point.rb'
require_relative '../../app/models/ship.rb'

Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |width, heigth|
  visit '/start'
  fill_in :width, :with => width
  fill_in :heigth, :with => heigth
  click_button 'create-board-button'
end

When(/^I create a small ship in position "(.*?)"$/) do |point|	
 #pending
end

Then(/^position "(.*?)" is not empty$/) do |point|
  #pending
end

When(/^I create a large ship in position "(.*?)"$/) do |point|
  #pending
end

Then(/^position "(.*?)" and one more position are not empty$/) do |point|
  #pending
end

Then(/^it should raise error "(.*?)"$/) do |msj|
  #pending
end