# == Schema Information
#
# Table name: requirements
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  event_id   :integer          not null
#  icon_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Requirement < ActiveRecord::Base
  validates :title, :event_id, presence: true

  belongs_to :event
end
