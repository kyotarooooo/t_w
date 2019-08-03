class Item < ApplicationRecord
	belongs_to :user
	attachment :item_image
end
