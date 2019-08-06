class Lesson < ApplicationRecord
	belongs_to :user
	has_many :attendances
	has_many :attendanced_users, through: :attendances, source: :user
end
