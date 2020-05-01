class EventArtist < ApplicationRecord
  belongs_to :artist
  belongs_to :event

  validates_associated :event, :artist
  validates_uniqueness_of :playing_order, scope: :event_id
  validates_presence_of :playing_order, if: -> { event.festival? }
end
