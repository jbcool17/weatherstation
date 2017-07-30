# == Schema Information
#
# Table name: notifications
#
#  id               :integer          not null, primary key
#  message          :text
#  contacts         :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  weather_datum_id :integer
#  sensor_id        :integer
#

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
