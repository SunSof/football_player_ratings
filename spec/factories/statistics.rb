FactoryBot.define do
  factory :statistic do
    player_id { 123 }
    saves { 3 }
    clearances { 2 }
    shot_blocks { 1 }
  end
end
