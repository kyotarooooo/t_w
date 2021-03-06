class LessonsController < ApplicationController
	def new
		@lesson = Lesson.new
	end

	def create
		@lesson = Lesson.new(lesson_params)
		#エラーメッセージでよく"User must exist"と出るが下記に追記が問題
		#@lesson.user_id に current_user.id 　を"代入"することでどのユーザーが投稿したのか判別できる
		#だから == にしてはいけない
		@lesson.user = current_user
		if @lesson.save
			flash[:success] = "レッスン内容を投稿しました"
			redirect_to lessons_path
		else
			render "new"
		end
	end

	def index
		@lessons = Lesson.all
	end

	def show
		@lesson = Lesson.find(params[:id])
		@attendance = Attendance.new
	end

	def edit
		@lesson = Lesson.find(params[:id])
	end

	def update
		@lesson = Lesson.find(params[:id])
		@lesson.user == current_user
		if @lesson.update(lesson_params)
			flash[:success] = "レッスン内容を更新しました"
			redirect_to lesson_path(@lesson)
		else
			render "edit"
		end
	end

	def destroy
		@lesson = Lesson.find(params[:id])
		@lesson.destroy
		redirect_to lessons_path
	end

	private
	def lesson_params
		params.require(:lesson).permit(:user_id, :lesson_name, :location, :time, :entry_count, :over_view)
	end
end
