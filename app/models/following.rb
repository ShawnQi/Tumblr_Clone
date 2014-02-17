# == Schema Information
#
# Table name: followings
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Following < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id
  
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
