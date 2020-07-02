class CreateBookingAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_appointments do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.date :booking_date
      t.string :from_time
      t.string :to_time
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
