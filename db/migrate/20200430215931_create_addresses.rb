# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.references :addressable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
