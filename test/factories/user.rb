FactoryBot.define do
  factory :user do
    name { "Darth Vader" }
    sequence (:email) { |n| "vader#{n}@empire.com" }
    password {'password'}
    password_confirmation {'password'}
  end
end
