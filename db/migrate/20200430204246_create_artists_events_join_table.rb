class CreateArtistsEventsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :events, :artists, column_options: { type: :uuid } do |t|
      t.index :event_id
      t.index :artist_id
    end
  end
end
