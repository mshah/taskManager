class RegistrationsController < Devise::RegistrationsController
  def new
		build_resource(:time_zone =>params[:time_zone])
    respond_with self.resource
  end

  def update
    @user.update(user_params)
    super  
  end

private
  def user_params
    params.require(:user).permit(:time_zone)
  end 

def sign_up_params
    allow = [:email, :password, :password_confirmation, :time_zone]
    params.require(resource_name).permit(allow)
  end   
end