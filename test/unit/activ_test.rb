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

require 'test_helper'

class ActivTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
