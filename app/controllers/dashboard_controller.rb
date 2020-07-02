class DashboardController < ApplicationController
	before_action :authenticate_user!

	def update_profile
	    current_user.update(user_params)
	    flash[:success] = "Profile Updated successfully."
	    redirect_to edit_user_registration_path
  	end

  	private

	def user_params
		params.require(:user).permit(:hospital_name, :hospital_address, :hospital_mobile_number)
	end

end
