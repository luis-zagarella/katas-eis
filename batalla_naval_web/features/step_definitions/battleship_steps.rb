require_relative '../../app/models/board.rb'
require_relative '../../app/models/point.rb'
require_relative '../../app/models/ship.rb'

Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |width, heigth|
  visit '/start'
  fill_in :width, :with => width
  fill_in :heigth, :with => heigth
  click_button 'create_board_button'
end

When(/^I create a small ship in position "(.*?)"$/) do |point|	
  x, y = point.split ':'
  fill_in :x_small, :with => x
  fill_in :y_small, :with => y
  click_button 'create_small'
end

Then(/^position "(.*?)" is not empty$/) do |point|
  x, y = point.split ':'
  fill_in :x_empty, :with => x
  fill_in :y_empty, :with => y
  click_button "check_empty"
  page.should have_content('Position ' + x.to_s + ':' + y.to_s + ' empty: false.')
end

When(/^I create a large ship in position "(.*?)"$/) do |point|
  x, y = point.split ':'
  fill_in :x_large, :with => x
  fill_in :y_large, :with => y
  click_button 'create_large'
end

Then(/^it should raise error "(.*?)"$/) do |msj|
  #pending 
end