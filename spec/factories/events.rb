# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'MyString' }
    event_type { 1 }
    date { '2020-04-30' }
  end
end
