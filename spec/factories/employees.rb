FactoryBot.define do
  factory :employee do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
  end
end
