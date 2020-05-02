# frozen_string_literal: true

if Rails.env.development?
  puts '############ Creating events, with artists, genres and addresses'
  FactoryBot.create_list(:event, 10, :with_event_artists, :with_genres, :with_address)
end
