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
  validates :last_name, presence: true, unless: :using_oauth?
  validates :email, presence: true,
  uniqueness: true,
  format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, unless: :using_oauth?
  validates :uid, uniqueness: {scope: :provider}, if: :using_oauth?
  before_create :generate_api_key
  serialize :twitter_raw_data, Hash

  PROVIDER_TWITTER = "twitter"
  def using_oauth?
    uid.present? && provider.present?
  end
  def using_twitter?
    using_oauth? && provider == PROVIDER_TWITTER
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  def self.create_from_twitter(twitter_data)
    aauser = Aauser.new
    full_name = twitter_data["info"]["name"].split(" ")
    aauser.first_name       = full_name.first
    aauser.last_name        = full_name.last
    aauser.uid              = twitter_data["uid"]
    aauser.provider         = twitter_data["provider"]
    aauser.twitter_token    = twitter_data["credentials"]["token"]
    aauser.twitter_secret   = twitter_data["credentials"]["secret"]
    aauser.twitter_raw_data = twitter_data
    aauser.password           = SecureRandom.urlsafe_base64
    aauser.save!
    aauser
  end

  def self.find_or_create_from_twitter(twitter_data)
    aauser = Aauser.where(uid: twitter_data["uid"], provider: twitter_data["provider"]).first
    aauser = create_from_twitter(twitter_data) unless aauser
    aauser

  end



  private
  def generate_api_key
    # begin
    #  self.api_key = SecureRandom.urlsafe_base64
    # end while Aauser.exists?(api_key: api_key)
    loop do
      self.api_key = SecureRandom.urlsafe_base64
      break unless Aauser.exists?(api_key: api_key)
    end
  end


end
