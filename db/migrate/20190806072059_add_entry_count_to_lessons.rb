class AddEntryCountToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :entry_count, :integer
  end
end
