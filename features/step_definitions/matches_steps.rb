Given(/^I go to the new match page$/) do
  visit new_match_path
end

Given(/^I select a winner$/) do
  select "Marcy", from: "match_winner_player_id"
end

Given(/^I select the same player as a winner and a loser$/) do
  select "Peter", from: "match_winner_player_id"
  select "Peter", from: "match_loser_player_id"
end

Given(/^I select a loser$/) do
  select "Peter", from: "match_loser_player_id"
end

When(/^I submit my match$/) do
  click_on "Save"
end

Then(/^I should be on the player page$/) do
  current_path.should eq players_path
end

Then(/^I should be on the new match page$/) do
  current_path.should eq new_match_path
end

Then(/^I should see an error message about selecting the same players$/) do
  page.should have_content("Winner and loser must be different players")
end
