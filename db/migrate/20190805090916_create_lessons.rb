class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|

      t.integer :user_id
      t.string :lesson_name
      t.string :location
      t.string :time
      t.string :entry_count
      t.text :over_view
      t.timestamps
    end
  end
end
