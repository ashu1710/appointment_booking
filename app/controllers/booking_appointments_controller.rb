class BookingAppointmentsController < ApplicationController
	before_action :authenticate_user!
	def index
		@booking_data = BookingAppointment.where(doctor_id: current_user.id) 
	end

	def change_status
		@booking = BookingAppointment.find_by(id: params[:id]) 
		if @booking.present? && @booking.update(status: !@booking.status)
			flash[:success] = "Booking appointment accepted successfully."
		else
			flash[:error] = "Booking appointment not found."
		end
		redirect_to booking_appointments_path
	end
end
