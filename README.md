# README

## Authentication App.

User Model is a parent class for the:

1. Admin
2. Customer

Admins are able to view and edit all Customers
Customers are only able to view themselves.

# Testing on Heroku

Visit: https://auth-app-template.herokuapp.com/

You can find login credentials in the `db/seeds.rb` file.
The App is already seeded with this dummy data. Pick an Admin or a Customer and login.

Check the `routes.rb` file for all possible routes built.

The `spec/` folder contains all tests for every Model and Controller.

<hr>

- Ruby version

* 2.7.3

- System dependencies

  - rspec, et al

- Database creation

  - postgres sql

- Database initialization
  `rails db:seed`

- How to run the test suite
  `rspec spec/`
