# frozen_string_literal: true

class CreateProfileGenresJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :profiles, :genres, column_options: { type: :uuid } do |t|
      t.index %i[profile_id genre_id]
    end
  end
end
