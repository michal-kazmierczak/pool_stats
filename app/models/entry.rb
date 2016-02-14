# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  swimmers   :integer
#  device_id  :string
#  date       :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Entry < ActiveRecord::Base
end
