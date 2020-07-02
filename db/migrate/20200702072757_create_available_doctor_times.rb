class CreateAvailableDoctorTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :available_doctor_times do |t|
      t.date :custom_availabe_date
      t.string :from_time
      t.string :to_time
      t.boolean :no_available, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
