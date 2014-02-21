# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  draft      :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :body, :draft, :title, :user_id
  
  validates :title, :body, presence: true
  validates :title, length: 1..45
  
  belongs_to :user
  has_many :likes, dependent: :destroy
end
