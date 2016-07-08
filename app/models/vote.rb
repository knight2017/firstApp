class Vote < ActiveRecord::Base
  belongs_to :aauser
  belongs_to :question
  validates :aauser, uniqueness:{scope: :question}


  
end
