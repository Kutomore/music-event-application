# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :name
      t.integer :event_type
      t.date :date

      t.timestamps
    end
  end
end
