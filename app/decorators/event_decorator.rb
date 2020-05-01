# frozen_string_literal: true

class EventDecorator < Draper::Decorator
  delegate_all
  decorates_association :address

  def event_type
    object.event_type.humanize
  end

  def artists
    object.artists.map(&:name).join(', ')
  end

  def genres
    object.genres.map(&:name).join(', ')
  end
end
