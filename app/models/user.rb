# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :profile

  delegate :time_zone, :genre_ids, to: :profile

  accepts_nested_attributes_for :profile
end
