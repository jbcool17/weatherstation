# == Schema Information
#
# Table name: sensors
#
#  id                    :integer          not null, primary key
#  name                  :string
#  location              :string
#  api_key               :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  trigger_temp_max      :integer          default("90")
#  trigger_temp_min      :integer          default("32")
#  notification_interval :integer          default("30")
#

require 'test_helper'

class SensorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
