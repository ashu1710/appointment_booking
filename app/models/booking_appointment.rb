class BookingAppointment < ApplicationRecord
	##scope
	scope :booking_count, -> { where(status: true).count }

	def patient
		User.find_by(id: self.patient_id)
	end

	def doctor
		User.find_by(id: self.doctor_id)
	end
end
