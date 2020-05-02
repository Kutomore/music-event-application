# frozen_string_literal: true

FactoryBot.define do
  factory :event_artist do
    sequence(:playing_order) { |n| n}

    trait :with_event do
      after(:build) do |relationship|
        relationship.event = build :event, :with_genres, :with_address
      end
    end

    trait :with_artist do
      after(:build) do |relationship|
        relationship.artist = build :artist
      end
    end
  end
end
