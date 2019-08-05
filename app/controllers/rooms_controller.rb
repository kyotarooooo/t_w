class RoomsController < ApplicationController
	def create
		@room = Room.create
		#ログイン中のユーザーroom_idの中には今作ったID,user_idにはログイン中のユーザーID
		@entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
		#ストロングパラメータをここで定義して、user_idとroom_idをいれる。
		@entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
		redirect_to "/rooms/#{@room.id}"
	end

	def show
		@room = Room.find(params[:id])
		if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
			@messages = @room.messages
			@message = Message.new
			@entries = @room.entries
		else
			redirect_back(fallback_location: root_path)
		end
	end
end
