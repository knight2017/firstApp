class AnswerMailer < ApplicationMailer



def notify_question_owner(answer)
  @answer = answer
  @question = answer.question
  @owner = @question.aauser
  mail(to: @owner.email, subject: "you got an answer") if @owner
end







end
