class AnswersController < ApplicationController

  def create
    @answer = Answer.new answer_params
    @question = Question.find params[:question_id]
    @answer.question = @question
    if @answer.save
    redirect_to question_path(@question), notice: "Answer Created"
    else
     flash[:alert] = "Question not created!"
     render "/questions/show"
    end
  end

def destroy
  question = Question.find params[:question_id]
  answer = Answer.find params[:id]
  answer.destroy
  redirect_to question_path(question), notice: "deleted"
end


def answer_params
  params.require(:answer).permit(:body)
end



end
