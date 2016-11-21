# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  admin_id    :integer          not null
#  title       :string           not null
#  lat         :float            not null
#  lng         :float            not null
#  city        :string           not null
#  state       :string           not null
#  event_type  :string
#  image_url   :string
#  description :text             not null
#  pay         :integer          not null
#  pay_freq    :string           not null
#  start_date  :date             not null
#  end_date    :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  validates :admin, :title, :lat, :lng, :city, :state, :description, :pay, :pay_freq, :start_date, :end_date, presence: true

  belongs_to :admin,
    primary_key: :id,
    foreign_key: :admin_id,
    class_name: :User

  has_many :requests
  has_many :requirements
  belongs_to :company,
    through: :admin,
    source: :company
end
