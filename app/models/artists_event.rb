class ArtistsEvent < ApplicationRecord
  belongs_to :artist
  belongs_to :event
end
