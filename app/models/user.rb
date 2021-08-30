class User < ApplicationRecord
  scope :admins, -> { where(admin: true) }
  scope :customers, -> { where(admin: false) }
end
