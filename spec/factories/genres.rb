# frozen_string_literal: true

FactoryBot.define do
  factory :genre do
    initialize_with do
      Genre.find_or_initialize_by(
        name: Faker::Music.genre,
        description: 'Faker::Music.genre'
      )
    end

    trait :with_event do
      after(:build) do |genre|
        genre.events << build(:event, :with_event_artists, :with_address)
      end
    end
  end
end
