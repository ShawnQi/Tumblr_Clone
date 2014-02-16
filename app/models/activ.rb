# == Schema Information
#
# Table name: activs
#
#  id           :integer          not null, primary key
#  sent_title   :string(255)
#  sent_user_id :integer
#  got_title    :string(255)
#  got_user_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Activ < ActiveRecord::Base
  attr_accessible :sent_title, :sent_user_id, :got_title, :got_user_id
  
  belongs_to :sent_user, class_name: "User"
  belongs_to :got_user,  class_name: "User"
end
