class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :user_id
      t.string :category_name
      t.string :item_name
      t.string :length
      t.string :weight
      t.string :grip
      t.string :face
      t.text :body
      t.timestamps
    end
  end
end
