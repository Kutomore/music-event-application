class CreateGenresEventsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :events, :genres, column_options: { type: :uuid } do |t|
      t.index :event_id
      t.index :genre_id
    end
  end
end
