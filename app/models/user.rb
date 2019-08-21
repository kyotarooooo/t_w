class User < ApplicationRecord
	has_many :items, dependent: :destroy
	#いいね機能
	has_many :likes, dependent: :destroy
	has_many :liked_items, through: :likes, source: :item
	#フォロー機能
	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "follower_id",
									dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
									foreign_key: "followed_id",
									dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower
	#ユーザーをフォローする
	def follow(other_user)
		following << other_user
	end
	#ユーザーをフォロー解除する
	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end
	#現在のユーザーがフォローしてきたらtrueを返す
	def following?(other_user)
		following.include?(other_user)
	end
	#レッスン参加機能
	has_many :lessons, dependent: :destroy
	has_many :attendances, dependent: :destroy
	has_many :attendanced_lessons, through: :attendances, source: :lesson
	#すでにレッスンに参加しているか判定
	def already_attendanced?(lesson)
		self.attendances.exists?(lesson_id: lesson.id)
	end

	#すでにユーザーがアイテムに対していいねしているか判定
	def already_liked?(item)
	    self.likes.exists?(item_id: item.id)
	  end
	#以下2つはDM機能
	has_many :messages, dependent: :destroy
	has_many :entries, dependent: :destroy
	attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
