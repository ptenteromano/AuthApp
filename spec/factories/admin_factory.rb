FactoryBot.define do
  factory :admin do
    email { 'phil@test.com' }
    password_digest { BCrypt::Password.create('test') }
    first_name { 'Phil' }
    last_name { 'Tenteromano' }
  end
end
