# frozen_string_literal: true

class Genre < ApplicationRecord
  has_and_belongs_to_many :events
  has_and_belongs_to_many :profiles

  validates_presence_of :name, :description
end
