# frozen_string_literal: true

class Profile < ApplicationRecord
  include Addressable
  has_one :user

  enum gender: { undisclosed: 0, female: 1, male: 2, other: 3 }

  validates_presence_of :name, :birhtdate, :email, :phone, :gender, :addresses
end
