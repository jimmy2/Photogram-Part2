class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :user_name, :password)
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :password, :current_password)
  end
end 