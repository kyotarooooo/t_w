class Item < ApplicationRecord
	belongs_to :user
	#いいね機能
	has_many :likes
	has_many :liked_users, through: :likes, source: :user
	attachment :item_image
end
