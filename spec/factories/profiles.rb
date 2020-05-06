# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    name { 'MyString' }
    birthdate { '2020-05-01' }
    email { 'MyString' }
    phone { 'MyString' }
    gender { 1 }
  end
end
