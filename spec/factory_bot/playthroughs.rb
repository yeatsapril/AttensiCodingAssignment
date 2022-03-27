FactoryBot.define do
  factory :playthrough do
    started_playing { DateTime.now - rand(1..4).hours }
    finished_playing { DateTime.now }
    score { rand(1..100) }
    time_spent { 3600.00 }
    association(:player, factory: :player)
  end
end
