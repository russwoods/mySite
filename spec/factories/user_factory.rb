FactoryBot.define do
  sequence(:email) { |n| "test#{n}@example.com" }

  factory :user do
    email
    password "numberOne"
    first_name "Luka"
    last_name "Cabron"
    admin false
  end

end