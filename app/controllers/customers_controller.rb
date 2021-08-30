class CustomersController < ApplicationController
  before_action :customer?, only: [:index]
  before_action :logged_in?, only: [:show]
  before_action :go_to_dashboard?, only: [:login]

  # GET to show login form
  def login; end

# POST to login customer
  def login_submit
    params.permit(:email, :password, :authenticity_token, :commit)

    login_user(model: Customer)
  end

  # GET to /customer/index
  def index
    @current_user = current_user
  end

  def show
    @customer = Customer.find_by(uuid: params[:uuid])

    return handle_redirect if @customer.nil?
  end

  private

  def handle_redirect
    return redirect_to admin_dashboard_path if current_user.admin?

    redirect_to customer_dashboard_path
  end

  def customer?
    return if current_user&.customer?

    redirect_to root_path
  end
end
