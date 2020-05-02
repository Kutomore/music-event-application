# frozen_string_literal: true

module Addressable
  extend ActiveSupport::Concern

  included do
    has_one :address, as: :addressable, dependent: :destroy

    validates_associated :address
  end
end
