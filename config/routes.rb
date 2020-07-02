Rails.application.routes.draw do
  devise_for :users, :controllers => { passwords: 'users/passwords', registrations: 'users/registrations' }
  put 'update_profile', to: 'dashboard#update_profile', as: 'update_profile'
  resources :available_doctor_times
  resources :booking_appointments
  get 'change_status/:id', to: 'booking_appointments#change_status', as: 'change_status'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: "dashboard#index"

end
