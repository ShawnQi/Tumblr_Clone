# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  blog_name       :string(255)
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :email, :blog_name, :password
  attr_reader :password
  
  before_validation :ensure_session_token
  validates :username, :email, :blog_name, presence: true
  validates :username, :email, :blog_name, length: 4..30
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: 4..15, allow_nil: true
  
  has_many :posts, dependent: :destroy
  has_many :sent_activs, class_name: "Activ", foreign_key: "sent_user_id", dependent: :destroy
  has_many :got_activs,  class_name: "Activ", foreign_key: "got_user_id",  dependent: :destroy
  has_many :followers, class_name: "Following", foreign_key: "followed_id", dependent: :destroy
  has_many :following, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil unless user
    BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil
  end
  
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    return self.session_token
  end
  
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end
end
