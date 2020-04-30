# frozen_string_literal: true

class AddPlayingOrderToEventArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :event_artists, :playing_order, :integer

    add_index :event_artists,
              %i[event_id playing_order],
              unique: true,
              name: 'by_playing_order_and_event'
  end
end
