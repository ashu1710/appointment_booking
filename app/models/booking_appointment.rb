class BookingAppointment < ApplicationRecord
	##scope
	scope :booking_count, -> (current_user_id) { where("patient_id = ? OR doctor_id = ?", current_user_id, current_user_id).count }


	#validations
	validate :from_time_less_then_to_time?

	def from_time_less_then_to_time?
		if to_time.present? && from_time.present? && to_time.to_time < from_time.to_time
		  errors.add :to_time, "From time must be less then to time"
	    end
	end


	def patient
		User.find_by(id: self.patient_id)
	end

	def doctor
		User.find_by(id: self.doctor_id)
	end
end
