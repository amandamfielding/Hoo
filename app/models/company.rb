# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  description  :text             not null
#  logo_url     :string
#  image_url    :string
#  website_url  :string
#  facebook_url :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :users
  has_many :events,
    through: :users,
    source: :events
end
