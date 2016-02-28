# == Schema Information
#
# Table name: opening_hours
#
#  id          :integer          not null, primary key
#  day_of_week :integer
#  open_time   :time
#  close_time  :time
#  created_at  :datetime
#  updated_at  :datetime
#

class OpeningHours < ActiveRecord::Base
end
