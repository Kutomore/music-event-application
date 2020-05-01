# frozen_string_literal: true

class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
