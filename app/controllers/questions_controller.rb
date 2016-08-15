class QuestionsController < ApplicationController
 before_action :find_question, only:[:show, :edit, :update, :destroy]
 before_action :authenticate_user!, except: [:show, :index]



 def new
 @question = Question.new
 end

def create
  service = Questions::Create.new params: question_params,
                              aauser:   current_user
  if service.call
     redirect_to question_path(service.question), notice: "Question created!"
   else
     @question = service.question
     flash[:alert] = "Question not created!"
     render :new
   end
  #  # question = Question.new title: params[:question][:title],
  #  #                         body:  params[:question][:body]
  #  # question_params = params.require(:question).permit(:title, :body)
  # @question = Question.new question_params
  # @question.aauser = current_user
  # if @question.save
  #   if @question.tweet_it
  #     client = Twitter::REST::Client.new do |config|
  #       config.consumer_key        = ENV['TwittConsumer_Key']
  #       config.consumer_secret     = ENV['TwitterConsumer_Secret']
  #       config.access_token        = current_user.twitter_token
  #       config.access_token_secret = current_user.twitter_secret
  #     end
  #     client.update("#Question: #{@question.title} #{question_path(@question)}")
  #   end
  #   redirect_to question_path(@question), notice: "Question created!"
  #   # flash[:notice] = "Sucessful"
  #   # # redirect_to question_path({id: @question})
  #   # redirect_to question_path(id: @question)
  #   # # render json: params
  # else
  #   flash[:alert]= "not created!"
  #   render :new
  # end
  # # In the line below we're using the `strong parameters` feature of Rails
  # # In the line we're `requiring` that the `params` hash has a key called
  # # question and we're only allowing the `title` and `body` by fetched
end

def show
  #  @question = Question.find params[:id]
  #  @question = increment!(:view_count)
   count = @question.view_count + 1
   @question.update(view_count: count)
   @answer = Answer.new
   respond_to do |format|
      format.html
      format.json { render json: {question: @question, answers: @question.answers} }
    end
end

def index
  @questions = Question.order(created_at: :desc).page(params[:page]).per(params[:per] || 7)
    respond_to do |format|
      format.html
      format.json { render json: @questions }
      format.xml  { render xml:  @questions }
    end
end

def edit
# @question = Question.find params[:id]
end

def update
  @question.slug = nil
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

 def current_user_vote
    @question.vote_for(current_user)
 end
 helper_method :current_user_vote


 def question_params
   params.require(:question).permit(:title, :tweet_it, :body, :category_id, :image, {tag_ids: []})
 end
 def find_question
  @question = Question.find(params[:id]).decorate
 end

 def authenticate_user!
   redirect_to new_session_path, alert: "please sign in" unless user_signed_in?
 end



  def authorize_owner
   redirect_to root_path, alert: "access denied" unless can? :manage, @question
  end



end
