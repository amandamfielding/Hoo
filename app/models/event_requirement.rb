# == Schema Information
#
# Table name: event_requirements
#
#  id             :integer          not null, primary key
#  event_id       :integer          not null
#  requirement_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class EventRequirement < ActiveRecord::Base
  validates :event, :requirement, presence: true

  belongs_to :event
  belongs_to :requirement
end
