class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def purchase_index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@item.user = current_user
		if @item.save
			flash[:success] = "アイテムを登録しました"
			redirect_to root_path
		else
			render "new"
		end
	end

	def show
		@item = Item.find(params[:id])
		@like = Like.new
	end

	def liked_users
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		@item.user = current_user
		if @item.update(item_params)
			flash[:success] = "編集しました"
			redirect_to item_path(@item)
		else
			render "edit"
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to root_path
	end

	def purchase
		@item = Item.find(params[:id])
	end

	def purchase_confirm
		@item = Item.find(params[:id])
		@item.update(purchase: true, purchased_at: Time.current)
		redirect_to purchase_complete_path
	end

	def complete
		@item = Item.find(params[:id])
	end

	private
		def item_params
			params.require(:item).permit(:user_id, :item_image, :item_name, :category_name, :length, :weight, :grip, :face, :color, :body, :price, :stock)
		end
end

