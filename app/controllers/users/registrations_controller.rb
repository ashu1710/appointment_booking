# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    user = User.find_by email: params["user"]["email"]
    if user.present?
      flash[:error] = "Email address already present in our record."
      redirect_to new_user_registration_path
    else
      super
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    if current_user.valid_password? params[:user][:current_password]
      super
    else
      flash[:error] = "Please check your current password."
      redirect_to edit_user_registration_path
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    if params[:register_as].eql?('doctor')
      params[:user][:is_doctor] = true
    else
      params[:user].delete :hospital_name
      params[:user].delete :hospital_address
      params[:user].delete :hospital_mobile_number
    end
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :is_doctor, :hospital_name, :hospital_address, :hospital_mobile_number])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
