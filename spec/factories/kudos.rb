FactoryBot.define do
  factory :kudo do
    title { |n| "Test title no #{n}" }
    content { |n| "Test content no #{n}" }
    receiver { create(:employee) }
    giver { create(:employee) }
  end
end
