class AdminsController < ApplicationController
  before_action :admin?, only: [:index]
  before_action :go_to_dashboard?, only: [:login]

  # GET to show login form
  def login; end

  # POST to login admin
  def login_submit
    params.permit(:email, :password, :authenticity_token, :commit)

    login_user(model: Admin)
  end

  # GET to /admin/index
  def index
    @customers = Customer.all
  end

  def show
    @current_user = current_user
  end

  private

  def admin?
    redirect_to root_path unless current_user&.admin?
  end
end
