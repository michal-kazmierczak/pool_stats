# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  swimmers    :integer
#  device_id   :string
#  date        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  day_of_week :integer          not null
#

class Entry < ActiveRecord::Base
  validates :swimmers, presence: true, numericality: true
  validates :date, presence: true
  validates :device_id, length: { maximum: 40 }
end
