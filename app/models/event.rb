class Event < ApplicationRecord
  include Addressable

  has_and_belongs_to_many :genres
  has_many :event_artists
  has_many :artists, through: :event_artists

  validates :event_artists, length: { maximum: 1 }, if: :concert?
  validates_presence_of :date, :address, :genres

  enum event_type: { concert: 0, festival: 1 }

  accepts_nested_attributes_for :address
end
