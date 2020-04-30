class CreateEventArtistsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :event_artists, id: :uuid do |t|
      t.belongs_to :event, type: :uuid
      t.belongs_to :artist, type: :uuid

      t.timestamps
    end
  end
end
