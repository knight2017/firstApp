class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :aauser
  validates :body, presence: true, uniqueness:{scope: :question_id}





end
