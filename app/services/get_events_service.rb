# frozen_string_literal: true

class GetEventsService
  def initialize(params)
    @params = params
  end

  def self.perform(params)
    new(params).perform
  end

  def perform
    events
  end

  private

  def events
    Event
      .with_genres(params[:genre_ids])
      .without_genres(params[:exclude_genre_ids])
      .with_past_date(params[:with_past_date])
      .decorate
      .distinct
      .includes(:genres, :artists, :address)
      .group_by{ |event| event.date.to_date}
  end

  attr_accessor :params
end
