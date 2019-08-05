class User < ApplicationRecord
	has_many :items, dependent: :destroy
	has_many :lessons, dependent: :destroy
	#以下2つはDM機能
	has_many :messages, dependent: :destroy
	has_many :entries, dependent: :destroy
	attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
