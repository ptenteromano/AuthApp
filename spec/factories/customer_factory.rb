FactoryBot.define do
  factory :customer do
    email { 'john@test.com' }
    password_digest { BCrypt::Password.create('test') }
    first_name { 'John' }
    last_name { 'Doe' }
  end
end
