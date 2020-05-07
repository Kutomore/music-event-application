# frozen_string_literal: true

class AddDefaultToProfileGender < ActiveRecord::Migration[6.0]
  def up
    change_column_default :profiles, :gender, 0
  end

  def down
    change_column_default :profiles, :show_attribute, nil
  end
end
