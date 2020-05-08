# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true

  belongs_to :profile

  delegate :time_zone, :genre_ids, to: :profile

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
  end

  accepts_nested_attributes_for :profile
end
