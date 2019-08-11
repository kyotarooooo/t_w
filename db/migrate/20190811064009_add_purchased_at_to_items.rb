class AddPurchasedAtToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :purchased_at, :datetime
    add_column :items, :purchase, :boolean, null: false, default: false
  end
end