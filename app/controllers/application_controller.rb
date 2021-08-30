class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  GOOD_LOGIN = 'Successfully logged in.'.freeze
  BAD_LOGIN = 'Something went wrong. Make sure you\'re on the correct login screen and try again.'.freeze
  LOGGED_OUT = 'Logged Out'.freeze

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  ##
  # Polymorphic login solution
  #
  # @param [ActiveModel] model - which model to login as
  def login_user(model: User)
    flash.clear
    @user = model.find_by(email: params[:email], admin: model == Admin)

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      update_login_time(@user)
      return redirect_to "/#{model.name.downcase}/index", notice: GOOD_LOGIN
    end

    redirect_to "/#{model.name.downcase}/login", notice: BAD_LOGIN
  end

  def logout_user
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: LOGGED_OUT
  end

  def go_to_dashboard?
    return unless logged_in?
    return redirect_to admin_dashboard_path if current_user.admin?

    redirect_to customer_dashboard_path
  end

  def authorized?
    return if current_user&.admin? ||
              (logged_in? && current_user.uuid == params[:uuid])

    redirect_to root_path
  end

  private

  # Updates the login time on every login
  def update_login_time(user)
    user.last_login_time = Time.zone.now
    user.save!
  end
end
