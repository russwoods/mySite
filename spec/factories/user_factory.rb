FactoryBot.define do
    sequence(:email) {|n| "test#{n}@example.com"}

    factory :user do
      email
      password "password"
      first_name "John"
      last_name "Smith"
      admin false
    end

    factory :admin, class: User do
      email
      password "password"
      admin true
      first_name "Madeline"
      last_name "Smith"
    end

  end
