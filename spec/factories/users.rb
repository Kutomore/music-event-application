# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :with_profile do
      after(:build) do |user|
        user.profile = build :profile, :with_address, :with_genres
      end
    end
  end
end
