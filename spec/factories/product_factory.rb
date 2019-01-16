FactoryBot.define do
  sequence(:name) { |n| "#{n}" }

  factory :product do
    name 
    price 10.0
    description "Test description"
  end

end