FactoryBot.define do
  factory :player do
    sequence(:id) { |n| n }
    name { "Bob" }
    role { 0 }
  end
end
