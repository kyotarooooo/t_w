class RemoveEntryCountFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :entry_count, :string
  end
end
