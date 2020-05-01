class ChangeDateFormatInEvents < ActiveRecord::Migration[6.0]
  def up
    change_column :events, :date, :datetime
  end

  def down
    change_column :events, :date, :date
  end
end
