Given(/^I go to the new doubles page$/) do
  visit new_double_path
end

Given(/^I select two winners$/) do
  select "Josh", from: "match_first_winner_player_id"
  select "Marcy", from: "match_second_winner_player_id"
end

Given(/^I select two losers$/) do
  select "Peter", from: "match_first_loser_player_id"
  select "Stephanie", from: "match_second_loser_player_id"
end

Given(/^I select the same player as one of the winners and one of the losers$/) do
  select "Josh", from: "match_first_winner_player_id"
  select "Marcy", from: "match_second_winner_player_id"
  select "Peter", from: "match_first_loser_player_id"
  select "Josh", from: "match_second_loser_player_id"
end

Then(/^I should be on the new doubles page$/) do
  current_path.should eq new_double_path
end

Then(/^I should see an error message that all players should be different$/) do
  page.should have_content("All players must be different")
end
