class User < ApplicationRecord
	has_many :items, dependent: :destroy
	#いいね機能
	has_many :likes, dependent: :destroy
	has_many :liked_items, through: :likes, source: :item
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
