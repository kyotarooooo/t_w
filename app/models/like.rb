class Like < ApplicationRecord
  belongs_to :item
  belongs_to :user
  #validates_uniqueness_ofによってpost_idとuser_idの組が1組しか存在しないようにする
  validates_uniqueness_of :item_id, scope: :user_id
end
