# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string
#  admin           :boolean          not null
#  first_name      :string
#  last_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  last_login_time :datetime         not null
#  uuid            :string           not null
#
class User < ApplicationRecord
  has_secure_password
  after_initialize :init

  scope :admins, -> { where(admin: true) }
  scope :customers, -> { where(admin: false) }

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

  def init
    self.last_login_time ||= Time.zone.now
    self.uuid ||= SecureRandom.uuid
  end

  def admin?
    admin
  end

  def customer?
    !admin
  end
end
