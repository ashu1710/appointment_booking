class User < ApplicationRecord

  ##ralationships
  has_many :available_doctor_times, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  ##scope

  scope :user_count, -> { where(is_doctor: false).count }
  scope :doctor_count, -> { where(is_doctor: true).count }

end
