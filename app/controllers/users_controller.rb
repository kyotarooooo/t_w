class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		#ここからDM機能
		#entryのユーザーIDとログイン中のユーザーID同じ
		@currentUserEntry = Entry.where(user_id: current_user.id)
		#entryのユーザーIDと詳細ページ上のユーザーID同じ
		@userEntry = Entry.where(user_id: @user.id)
		if @user.id == current_user.id
			#何も表示させない
		else
			@currentUserEntry.each do |cu|
				@userEntry.each do |u|
					if cu.room_id == u.room_id then
						@isRoom = true
						@roomId = cu.room_id
					end
				end
			end
			if @isRoom
			else
				@room = Room.new
				@entry = Entry.new
			end
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user == current_user
		if @user.update(user_params)
			flash[:success] = "更新しました"
			redirect_to user_path(current_user)
		else
			render "edit"
		end
	end

	private
	def user_params
		params.require(:user).permit(:profile_image, :kanji, :kana, :user_name, :sex, :email, :postal_code, :address, :introduction)
	end
end