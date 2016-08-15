class LikesController < ApplicationController
 before_action :authenticate_user!



   def index
   @questions = current_user.liked_questions
   end

 def create
  @question = Question.find params[:question_id]
  l         = Like.new(question: @question, aauser: current_user)
  if l.save
  redirect_to question_path(@question), notice: "Thanks for liking"
   else
  redirect_to question_path(@question), alert: "already liked"
  end

 end

 def destroy
    question = Question.find params[:question_id]
    like  =  Like.find params[:id]
    like.destroy if can? :destroy, Like
    redirect_to question_path(question), notice: "Un-liked"
 end




end
