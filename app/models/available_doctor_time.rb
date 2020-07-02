class AvailableDoctorTime < ApplicationRecord
  #relationships
  belongs_to :user

  #validations
  validate :from_time_less_then_to_time?

  def from_time_less_then_to_time?

	if to_time.present? && from_time.present? && to_time < from_time
	  errors.add :to_time, "From time must be less then to time"
    end
  end

end
