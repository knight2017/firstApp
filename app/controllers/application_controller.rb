class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
     # methods defined here will be available to all controllers
   def current_user
    @current_user ||= Aauser.find(session[:aauser_id]) if session[:aauser_id]
   end
   helper_method :current_user

    def current_question
      @current_question ||= Question.find params[:question_id]
    end
    helper_method :current_question
     # if we need methods to be available in view files we will need to add
     # `helper_method` and the first argument is the method name as a symbol

   def user_signed_in?
      session[:aauser_id].present?
   end
    helper_method :user_signed_in?

   def sign_in(user)
       session[:aauser_id] = user.id
   end

   def authenticate_user!
     redirect_to new_session_path, alert: "please sign in" unless user_signed_in?
   end
end
