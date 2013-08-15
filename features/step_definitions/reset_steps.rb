Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I click on Reset$/) do
  click_on "Reset"
end

Then(/^I should see that no players have played a game$/) do
  page.should have_content("None of the players have played a game")
end
