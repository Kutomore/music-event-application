# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    name { Faker::Name.name }
    birthdate { Faker::Date.birthday }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.subscriber_number(length: 12) }
    gender { Faker::Gender.binary_type.parameterize }
    time_zone { 'UTC' }

    trait :with_genres do
      after(:build) do |profile|
        profile.genres << build_list(:genre, rand(1..10))
      end
    end

    trait :with_address do
      after(:build) do |profile|
        profile.address = build :address, addressable: profile
      end
    end

    trait :with_user do
      after(:build) do |profile|
        profile.user = build(:user)
      end
    end
  end
end
