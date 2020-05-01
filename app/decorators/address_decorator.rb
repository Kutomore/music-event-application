# frozen_string_literal: true

class AddressDecorator < Draper::Decorator
  delegate_all

  def to_s
    [street, state, city, zip].select(&:present?).join(', ')
  end
end
