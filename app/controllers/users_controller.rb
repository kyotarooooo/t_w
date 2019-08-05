class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
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
