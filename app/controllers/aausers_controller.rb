class AausersController < ApplicationController

def new
  @user = Aauser.new



end
# def create
#     user_params = params.require(:user).permit(:first_name, :last_name, :email,
#                                                 :password, :password_confirmation)
#     @user = User.new user_params
#     if @user.save
#       sign_in(@user)
#       redirect_to root_path, notice: "You're now signed up!"
#     else
#       render :new
#     end
#   end
def create
 user_params = params.require(:aauser).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    @user = Aauser.new user_params
    if @user.save
      session[:aauser_id] = @user.id
      redirect_to root_path, notice: "User added"
    else
      render :new
    end
end

end
