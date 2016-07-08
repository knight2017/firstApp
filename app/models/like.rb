class Like < ActiveRecord::Base
  belongs_to :aauser
  belongs_to :question
  validates :aauser_id, uniqueness:{scope: :question_id}





end
