# frozen_string_literal: true

class ProfileDecorator < Draper::Decorator
  delegate_all
  decorates_association :address

  def gender
    object.gender.humanize
  end

  def genres
    object.genres.map(&:name).join(', ')
  end
end
