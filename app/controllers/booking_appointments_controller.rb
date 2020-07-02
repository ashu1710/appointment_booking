class BookingAppointmentsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_doctor, only: [:index, :change_status]
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

	def my_booking
		@booking_data = BookingAppointment.where(patient_id: current_user.id) 
	end

	def list_doctor
		@doctors = User.doctors
	end

	def check_doctor_avaibility
		@availblity_doctor_time = AvailableDoctorTime.find_by user_id: params["doctor_id"], custom_availabe_date: params["selected_date"].to_date
	end	

	def book_appointment
		@booking_data = BookingAppointment.new(booking_params)
		@booking_data.save
	end

	private

	def booking_params
		params[:patient_id] = current_user.id
		params.permit(:booking_date, :from_time, :to_time, :doctor_id, :patient_id)
	end
end
