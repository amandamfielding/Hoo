# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  event_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  accepted   :boolean          default(FALSE)
#

class Request < ActiveRecord::Base
  validates :event, :user, presence: true
  validates :event_id, uniqueness: {scope: :user_id}

  belongs_to :event
  belongs_to :user
end
