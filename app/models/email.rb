# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  email      :string
#  sensors    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Email < ApplicationRecord
  serialize :sensors, Array


  # Validations
  # validates :email, presence: true
  # validates :email, uniqueness: true
end
