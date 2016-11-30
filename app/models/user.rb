# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  fname           :string           not null
#  lname           :string           not null
#  gender          :string           not null
#  dob             :date             not null
#  email           :string           not null
#  phone_number    :string           not null
#  about_me        :text
#  image_url       :string
#  resume_url      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :integer
#  tips_cert       :boolean          default(FALSE)
#  vis_tats        :boolean          default(FALSE)
#  felonies        :boolean          default(FALSE)
#  valid_dl        :boolean          default(FALSE)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, :fname, :lname, :gender, :dob, :email, :phone_number, presence: true
  validates :password, length: {minimum:6, allow_nil: true}
  validates :username, :email, :session_token, uniqueness: true

  belongs_to :company
  has_many :events,
    primary_key: :id,
    foreign_key: :admin_id,
    class_name: :Event
  has_many :requests

  after_initialize :ensure_token

  def self.find_by_credentials(username,password)
    @user = User.find_by(username: username)
    return nil unless @user
    @user.is_password?(password) ? @user : nil
  end

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

  private
  def ensure_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
