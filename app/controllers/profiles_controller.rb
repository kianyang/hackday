class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @header = "Profile"
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:notice] = 'Profile updated successfully'
    else
      flash[:notice] = 'There was a problem saving your profile'
    end
    render :edit
  end

  private 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :country, :city, :postal_code)
  end
end
