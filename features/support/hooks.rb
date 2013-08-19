Before do
  FactoryGirl.create(:player, name: "Peter", ranking: 500, reached_pro: false)
  FactoryGirl.create(:player, name: "Marcy", ranking: 1500, reached_pro: false)
  FactoryGirl.create(:player, name: "Josh", ranking: 5500, reached_pro: true)
  FactoryGirl.create(:player, name: "Stephanie", ranking: 700, reached_pro: false)
end
