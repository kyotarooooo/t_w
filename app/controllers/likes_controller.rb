class LikesController < ApplicationController
	def create
		@like = current_user.likes.create(item_id: params[:item_id])
		#ログイン中のユーザーのいいねを作る→likesテーブルのitem_idにURLのidを入れる
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
		#likeテーブルのitem_idはURLのitem_idを参照、user_idはログイン中のidを参照
		@like.destroy
		redirect_back(fallback_location: root_path)
	end
end
