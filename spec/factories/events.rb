# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::Music.album }
    event_type { Event.event_types.keys[rand(0..1)] }
    date { Faker::Time.between(from: DateTime.now - 100.days, to: DateTime.now + 100.days ) }

    trait :with_event_artists do
      after(:build) do |event|
        if event.festival?
          event.event_artists << build_list(:event_artist, rand(2..10), :with_artist, event: event)
        else
          event.event_artists << build(:event_artist, :with_artist, event: event)
        end
      end
    end

    trait :with_genres do
      after(:build) do |event|
        event.genres << build_list(:genre, rand(1..10))
      end
    end

    trait :with_address do
      after(:build) do |event|
        event.address = build :address, addressable: event
      end
    end
  end
end
