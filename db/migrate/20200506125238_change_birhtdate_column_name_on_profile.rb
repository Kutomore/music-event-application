# frozen_string_literal: true

class ChangeBirhtdateColumnNameOnProfile < ActiveRecord::Migration[6.0]
  def change
    rename_column :profiles, :birhtdate, :birthdate
  end
end
