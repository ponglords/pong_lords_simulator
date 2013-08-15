Before do
  FactoryGirl.create(:winner, name: "Peter", ranking: 500, reached_pro: false)
  FactoryGirl.create(:winner, name: "Marcy", ranking: 1500, reached_pro: false)
  FactoryGirl.create(:winner, name: "Josh", ranking: 5500, reached_pro: true)
end
