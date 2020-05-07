# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  around_action :set_time_zone, if: :current_user

  private

  def set_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
