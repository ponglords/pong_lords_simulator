FactoryGirl.define do
  factory :winner, class: Player do
    name "Winner"
  end

  factory :loser, class: Player do
    name "Loser"
  end

  factory :winning_result, class: Result do
    won true
    association :player, factory: :winner
  end

  factory :losing_result, class: Result do
    won false
    association :player, factory: :loser
  end

  factory :match do
    after(:create) do |match|
      match.results << FactoryGirl.create(:winning_result)
      match.results << FactoryGirl.create(:losing_result)
    end
  end
end
