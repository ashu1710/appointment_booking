class ApplicationController < ActionController::Base

	def check_doctor
		redirect_to root_path unless current_user.is_doctor?
	end
end
