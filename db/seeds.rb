# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test_password = 'test'

# Admins
Admin.create(
  email: 'phil@test.com',
  password_digest: BCrypt::Password.create(test_password),
  first_name: 'Phil',
  last_name: 'Tenteromano',
  # last_login_time: Time.zone.now
)

Admin.create(
  email: 'ruby@test.com',
  password_digest: BCrypt::Password.create(test_password),
  first_name: 'Ruby',
  last_name: 'OnRails'
)

# Customers
Customer.create(
  email: 'john@test.com',
  password_digest: BCrypt::Password.create(test_password),
  first_name: 'John',
  last_name: 'Doe'
)

Customer.create(
  email: 'jay@test.com',
  password_digest: BCrypt::Password.create(test_password),
  first_name: 'Jay',
  last_name: 'Kay'
)

Customer.create(
  email: 'jane@test.com',
  password_digest: BCrypt::Password.create(test_password),
  first_name: 'Jane',
  last_name: 'Smith'
)
