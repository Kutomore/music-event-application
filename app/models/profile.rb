# frozen_string_literal: true

class Profile < ApplicationRecord
  include Addressable
  has_one :user
  has_and_belongs_to_many :genres

  enum gender: { undisclosed: 0, female: 1, male: 2, other: 3 }

  validates_presence_of :name, :birthdate, :email, :phone, :address, :time_zone
  validates :phone, numericality: true, length: { minimum: 8, maximum: 15 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone::MAPPING.keys
end
