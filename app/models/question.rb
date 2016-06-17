class Question < ActiveRecord::Base
 # has_many helps us set up the association between question model and the
 # answer model. In this case `has_many` assumes that the answers table contain
 # a field named `question_id` that is an integer (this is a Rails convention).
 # the dependent option takes valus like `destroy` and `nullify`
 # `destroy` will make Rails automatically delete associated answers before
 # deleting the question.
 # `nullify` will make Rails turn `question_id` values of associated records
 # to `NULL` before deleting the question.
  has_many :answers, dependent: :destroy
  belongs_to :category
  belongs_to :aauser
  # has_many :answers, dependent: :nullify
  validates(:title, {presence: {message: "must br asd"}, uniqueness: true})
  # validates :body, presence: true,
  #                  length: {minimum: 7},
  #                  uniqueness: {scope: :title}

  # validates :view_count, numericality: {greater_than_or_equal_to: 0}


  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # validates :email, format: VALID_EMAIL_REGEX
  # # validates :body,  presence: true
scope :recent, lambda { |count| where("created_at > ?", 3.days.ago).limit(count)}
# def self.recent(count)
#   where("created_at > ?", 2.days.ago).limit(count)
# end
 validate :no_monkey
 validate :body_no_title
 after_initialize :set_defaults
 before_validation :cap_title
 before_save :squz
  # before_validation
  # after_validation
 def self.search(str)
  #  where(['title ILIKE ? OR body ILIKE ?', "%#{str}%","%#{str}%"]).limit(10)
   where(['title ILIKE :word OR body ILIKE :word', {word: "%#{str}%"}]).limit(10)
 end
def new_first_answer
answers.order(id: :desc)
end

private
def squz
  if title != nil && body != nil
   self.title = title.squeeze(' ')
   self.body  = body.squeeze(' ')
  end
end

 def set_defaults
   self.view_count ||= 0
 end

def cap_title
  self.title = title.capitalize
end

def body_no_title
  if body.include?(title)
    errors.add(:body, "cant contain title")
  end
end

def no_monkey
  if title && title.downcase.include?('monkey')
      errors.add(:title, "no monkey")
  end
end


end
