class AttendancesController < ApplicationController

	def create
		@attendance = current_user.attendances.create(lesson_id: params[:lesson_id])
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@attendance = Attendance.find_by(lesson_id: params[:lesson_id], user_id: current_user.id)
		@attendance.destroy
		redirect_back(fallback_location: root_path)
	end
end
