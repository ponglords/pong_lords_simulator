FactoryGirl.define do
  factory :player do
    sequence(:name) {|n| "Player #{n}" }
  end

  factory :result do
    won true
    association :player, factory: :player
  end

  factory :match do
    after(:create) do |match|
      match.results << FactoryGirl.create(:result)
      match.results << FactoryGirl.create(:result, won: false)
    end
  end
end
