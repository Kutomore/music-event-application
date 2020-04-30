class Event < ApplicationRecord
  has_and_belongs_to_many :artists
  validates :artists, length: { maximum: 1 }, if: :concert?

  enum event_type: { concert: 0, festival: 1 }
end
