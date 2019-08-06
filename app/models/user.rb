class User < ApplicationRecord
	has_many :items, dependent: :destroy
	has_many :lessons, dependent: :destroy
	has_many :attendances, dependent: :destroy
	has_many :attendanced_lessons, through: :attendances, source: :lesson
	def already_attendanced?(lesson)
		self.attendances.exists?(lesson_id: lesson.id)
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
