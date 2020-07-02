class AvailableDoctorTimesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_available_time, only: [:edit, :update, :destroy]
	def index
		@available_times = AvailableDoctorTime.all
	end

	def new
		@available_time = AvailableDoctorTime.new
	end

	def create
		@available_time = current_user.available_doctor_times.new(available_time_params)
		if @available_time.save
			flash[:success] = 'Record created successfully.'
			redirect_to available_doctor_times_path
		else
			flash[:error] = @available_time.errors.messages[:to_time].join(", ")
			redirect_to new_available_doctor_time_path
		end
	end

	def update
		if @available_time.update(available_time_params)
			flash[:success] = 'Record updated successfully.'
			redirect_to available_doctor_times_path
		else
			flash[:error] = @available_time.errors.messages[:to_time].join(", ")
			redirect_to edit_available_doctor_time_path(@available_time)
		end
	end

	def destroy
		if @available_time.destroy
			flash[:success] = 'Record deleted successfully.'
		else
			flash[:error] = @available_time.errors.messages[:to_time].join(", ")
		end
		redirect_to available_doctor_times_path
	end

	private

	def set_available_time
		@available_time = AvailableDoctorTime.find_by id: params[:id]
	end

	def available_time_params
		params[:available_doctor_time][:no_available] = params[:available_doctor_time][:no_available].eql?('true') 
		params.require(:available_doctor_time).permit(:custom_availabe_date, :from_time, :to_time, :no_available)
	end
end
