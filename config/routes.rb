Rails.application.routes.draw do
  devise_for :users, :controllers => { passwords: 'users/passwords', registrations: 'users/registrations' }
  put 'update_profile', to: 'dashboard#update_profile', as: 'update_profile'
  resources :available_doctor_times
  resources :booking_appointments
  get 'change_status/:id', to: 'booking_appointments#change_status', as: 'change_status'
  get 'my_booking', to: 'booking_appointments#my_booking', as: 'my_booking'
  get 'list_doctor', to: 'booking_appointments#list_doctor', as: 'list_doctor'
  get 'check_doctor_avaibility', to: 'booking_appointments#check_doctor_avaibility'
  get 'book_appointment', to: 'booking_appointments#book_appointment', as: 'book_appointment'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: "dashboard#index"

end
