class Aauser < ActiveRecord::Base
#has_secure_password will give us functionalities needed for user authentication
#1- it will add attribute accessors: password, password_confirmation
#2- it will add a validattion for password presence and length of password
#3- if password_confirmation id set, it will validates that it is the same password
#4- it will add handy methods for us to automatically

has_secure_password
has_many :questions, dependent: :nullify
has_many :likes, dependent: :destroy
has_many :liked_questions, through: :likes, source: :question
has_many :votes, dependent: :destroy
has_many :voted_questions, through: :votes, source: :question
attr_accessor :abc
validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true,
                  uniqueness: true,
                  format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i


  def full_name
    "#{first_name} #{last_name}"
  end


end
