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
class Customer < User
  default_scope { where(admin: false) }

  before_save do
    self.admin = false
  end
end
