# == Schema Information
#
# Table name: weather_data
#
#  id         :integer          not null, primary key
#  temp       :float
#  humidity   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  location   :text
#  sensor_id  :integer
#

require 'test_helper'

class WeatherDatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
