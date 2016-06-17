class HomeController < ApplicationController
# methods defined in controller are called actions
def index
session[:abc] = "Hello World"
session[:hello] = "Hi"
# cookies.signed[:hello] = "Hello World"

end

def greet
#symble and string all good in params
@name = params[:name]


end





def about
  # render text: "About Us"

  ##this tells rails tto look for a file:/app/views/home/about.html.erb
  ##it will render the file and send it to as a response
  ##layout: :application tellls rails to Use:
  ##/app/views/layout/application.html.erb
   render :about, layout: 'application'
 ### dont need the above line it is default
end

end
