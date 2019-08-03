class ItemsController < ApplicationController
	def index
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@item.user = current_user
		if @item.save
			flash[:success] = "アイテムを登録しました"
			redirect_to items_path
		else
			render "new"
		end
	end

	private
		def item_params
			params.require(:item).permit(:user_id, :item_image, :item_name, :category_name, :length, :weight, :grip, :face, :color, :body)
		end
end
