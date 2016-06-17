class SessionsController < ApplicationController

def new

end

# def create
#     user = User.find_by_email params[:email]
#     if user && user.authenticate(params[:password])
#       sign_in(user)
#       redirect_to root_path, notice: "Signed In!"
#     else
#       flash[:alert] = "Wrong credentials"
#       render :new
#     end
#   end
def create
    user= Aauser.find_by_email params[:email]
   if user && user.authenticate(params[:password])
    session[:aauser_id] = user.id
    redirect_to root_path, notice: "hello"
  else
    render :new
  end
end



def destroy
  session[:aauser_id] = nil
  redirect_to root_path, notice: "signed out"
end




end
