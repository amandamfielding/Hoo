# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  city       :string           not null
#  state_code :string           not null
#  zip        :integer          not null
#  latitude   :integer          not null
#  longitude  :integer          not null
#  county     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ActiveRecord::Base
end
