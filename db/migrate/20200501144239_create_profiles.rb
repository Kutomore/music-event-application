# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.string :name
      t.date :birhtdate
      t.string :email
      t.string :phone
      t.integer :gender

      t.timestamps
    end
  end
end
