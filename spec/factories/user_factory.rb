FactoryBot.define do
  factory :user do
    email { 'phil@test.com' }
    password_digest { BCrypt::Password.create('test') }
    first_name { 'Phil' }
    last_name { 'Tenteromano' }
    admin { true }
  end
end
