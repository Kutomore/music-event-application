# frozen_string_literal: true

FactoryBot.define do
  factory :artist do
    initialize_with { Artist.find_or_initialize_by(name: Faker::Music.band) }

    trait :with_event_artists do
      after(:build) do |artist|
        build :event_artist, :with_event, artist: artist
      end
    end
  end
end
