require_relative '../../app/models/board.rb'
require_relative '../../app/models/ship.rb'
require_relative '../../app/models/point.rb'

Given(/^a large ship in position: “(\d+):(\d+)”$/) do |x, y|
  fill_in :x_large, :with => x
  fill_in :y_large, :with => y
  click_button 'create_large'
end

When(/^I shoot to position “(\d+):(\d+)”$/) do |x, y|
  fill_in :x_shoot, :with => x
  fill_in :y_shoot, :with => y
  click_button 'shoot_button'
end

Then(/^I get hit$/) do
  page.should have_content('hit')
end

Then(/^I get water$/) do
  page.should have_content('water')
end

Then(/^I get sink$/) do
  page.should have_content('sink')
end