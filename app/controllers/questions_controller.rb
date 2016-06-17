class QuestionsController < ApplicationController
 before_action :find_question, only:[:show, :edit, :update, :destroy]
 before_action :authenticate_user!, except: [:show, :index]



 def new
 @question = Question.new
 end

def create
 # question = Question.new title: params[:question][:title],
 #                         body:  params[:question][:body]
 # question_params = params.require(:question).permit(:title, :body)
@question = Question.new question_params
@question.aauser = current_user
if @question.save
  flash[:notice] = "Sucessful"
  # redirect_to question_path({id: @question})
  redirect_to question_path(id: @question)
  # render json: params
else
  flash[:alert]= "not created!"
  render :new
end
# In the line below we're using the `strong parameters` feature of Rails
# In the line we're `requiring` that the `params` hash has a key called
# question and we're only allowing the `title` and `body` by fetched
end

def show
  #  @question = Question.find params[:id]
  #  @question = increment!(:view_count)
   count = @question.view_count + 1
   @question.update(view_count: count)
   @answer = Answer.new
end

def index
  @questions = Question.order(created_at: :desc)
end

def edit
# @question = Question.find params[:id]
end

def update

  # @question = Question.find params[:id]
  # question_params = params.require(:question).permit(:title, :body)
  if @question.update question_params
    redirect_to question_path(@question), notice: "updated"
  else
    render :edit
  end
end

def destroy
# @question = Question.find params[:id]
@question.destroy
redirect_to questions_path, notice: "destroyed"
end
 private

 def question_params
    params.require(:question).permit(:title, :body, :category_id)
 end
 def find_question
  @question = Question.find params[:id]
 end

 def authenticate_user!
   redirect_to new_session_path, alert: "please sign in" unless user_signed_in?

 end


end
