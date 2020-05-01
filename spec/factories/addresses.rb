# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    zip { 'MyString' }
    addressable { nil }
  end
end