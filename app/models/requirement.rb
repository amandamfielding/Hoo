# == Schema Information
#
# Table name: requirements
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  icon_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Requirement < ActiveRecord::Base
  validates :title, presence: true

  has_many :event_requirements

  has_many :events,
    through: :event_requirements,
    source: :event
end
