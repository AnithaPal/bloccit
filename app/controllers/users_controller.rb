class UserController < ApplicationController
  before_action :authenticate_user!

  def update
    if curent_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user infomation" 
      redirect_to edit_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end  
end    