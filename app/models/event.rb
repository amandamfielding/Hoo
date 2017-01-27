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
  has_many :applicants,
    through: :requests,
    source: :user

  has_many :event_requirements
  has_many :requirements,
    through: :event_requirements,
    source: :requirement

  has_one :company,
    through: :admin,
    source: :company

  LOCATIONS = {
    "San Francisco, CA" => {"lat" => 37.7749, "lng" => -122.4194},
    "Napa, CA" => {"lat" => 38.2975, "lng" => -122.2869},
    "Berkeley, CA" => {"lat" => 37.8716, "lng" => -122.2727},
    "Los Angeles, CA" => {"lat" => 34.074195, "lng" => -118.328934},
    "Indio, CA" => {"lat" => 33.7206, "lng" => -116.2156}
  }

  def self.find_by_search(city, dist, date, created = {})
    if date == "week"
      date = Date.today + 7.days
    elsif date == "month"
      date = Date.today + 1.month
    elsif date == "3 months"
      date = Date.today + 3.months
    elsif date == "6 months"
      date = Date.today + 6.months
    elsif date == "year"
      date = Date.today + 1.year
    end

    if created[:admin_id]
      if (date && date != "any date") && (created[:applicants] != "") && created[:requirements]
        events = Event.joins(:requests, :event_requirements)
            .where("events.admin_id = ? AND event_requirements.requirement_id IN (?) AND events.start_date BETWEEN ? AND ?", created[:admin_id], created[:requirements], Date.today, date)
            .group("events.id").having("COUNT(*) >= ?", created[:applicants])
            .group("events.id").having("COUNT(*) = ?", created[:requirements].length)
            .order("events.id").distinct
      elsif (date && date != "any date") && created[:requirements]
        events = Event.joins(:event_requirements)
            .where("events.admin_id = ? AND event_requirements.requirement_id IN (?) AND events.start_date BETWEEN ? AND ?", created[:admin_id], created[:requirements], Date.today, date)
            .group("events.id").having("COUNT(*) = ?", created[:requirements].length)
            .order("events.id").distinct
      elsif (date && date != "any date") && (created[:applicants] != "")
        events = Event.joins(:requests)
            .where("events.admin_id = ? AND events.start_date BETWEEN ? AND ?", created[:admin_id], Date.today, date)
            .group("events.id").having("COUNT(*) >= ?", created[:applicants])
      elsif (created[:applicants] != "") && created[:requirements]
        events = Event.joins(:requests, :event_requirements)
            .where("events.admin_id = ?", created[:admin_id])
            .group("events.id").having("COUNT(*) >= ?", created[:applicants])
      elsif (created[:applicants] != "")
        events = Event.joins(:requests)
            .where("events.admin_id = ?", created[:admin_id])
            .group("events.id").having("COUNT(*) >= ?", created[:applicants])
      elsif created[:requirements]
        events = Event.joins(:event_requirements)
            .where("events.admin_id = ? AND event_requirements.requirement_id IN (?)", created[:admin_id], created[:requirements])
            .group("events.id").having("COUNT(*) = ?", created[:requirements].length)
            .order("events.id").distinct
      elsif (date && date != "any date")
        events = Event.where("events.admin_id = ? AND events.start_date BETWEEN ? AND ?", created[:admin_id], Date.today, date)
      else
        events = Event.where("admin_id = ?", created[:admin_id])
      end
    elsif date && date != "any date"
      events = Event.where("start_date BETWEEN ? AND ?", Date.today, date)
    else
      events = Event.all
    end

    return events if dist == "40" || !dist
    coordinates = LOCATIONS[city]
    latitude = coordinates["lat"]
    longitude = coordinates["lng"]
    closeby_events = events.select{ |event| event.distance([latitude, longitude]) < dist.to_i }

    closeby_events
  end

  def distance(loc1)
    loc2 = [self.lat, self.lng]
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters
    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    meters_per_mile = 1609.34
    (rm * c / meters_per_mile) # Delta in miles
  end
end
