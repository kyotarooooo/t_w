class AddPriceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :price, :integer
    add_column :items, :stock, :integer
  end
end
