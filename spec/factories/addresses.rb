# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.postcode }

    trait :with_event do
      after(:build) do |address|
        address.addressable = build :event, :with_event_artists, :with_genres
      end
    end
  end
end
