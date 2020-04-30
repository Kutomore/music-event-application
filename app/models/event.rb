class Event < ApplicationRecord
  has_and_belongs_to_many :genres
  has_many :event_artists
  has_many :artists, through: :event_artists

  validates :event_artists, length: { maximum: 1 }, if: :concert?
  validates :genres, length: { minimum: 1 }

  enum event_type: { concert: 0, festival: 1 }
end
