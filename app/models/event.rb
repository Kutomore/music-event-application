# frozen_string_literal: true

class Event < ApplicationRecord
  include Addressable

  has_and_belongs_to_many :genres
  has_many :event_artists, dependent: :delete_all
  has_many :artists, through: :event_artists

  validates :event_artists, length: { maximum: 1 }, if: :concert?
  validates_presence_of :date, :address, :genres

  enum event_type: { concert: 0, festival: 1 }

  default_scope { order(date: :asc) }

  before_save { binding.pry if address.blank? || !address.valid?}

  scope :without_genre, lambda { |genre_ids = nil|
    left_joins(:genres).where.not(genres: { id: genre_ids }) unless genre_ids.blank?
  }
  scope :with_genre, lambda { |genre_ids = nil|
    joins(:genres).where(genres: { id: genre_ids }) unless genre_ids.blank?
  }

  accepts_nested_attributes_for :address
end
