class AddItemImageIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_image_id, :text
    add_column :items, :color, :string
  end
end
