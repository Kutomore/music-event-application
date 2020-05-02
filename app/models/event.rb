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

  scope :without_genres, lambda { |genre_ids = nil|
    unless genre_ids.blank?
      left_joins(:genres).where.not(genres: { id: genre_ids })
    end
  }
  scope :with_genres, lambda { |genre_ids = nil|
    joins(:genres).where(genres: { id: genre_ids }) unless genre_ids.blank?
  }
  scope :with_past_date, lambda { |value = nil|
    if ActiveModel::Type::Boolean.new.cast(value&.downcase)
      where('date < ?', DateTime.current)
    else
      where('date > ?', DateTime.current)
    end
  }

  accepts_nested_attributes_for :address
end
