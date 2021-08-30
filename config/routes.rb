Rails.application.routes.draw do
  get '/', to: 'home#welcome', as: :root
  get '/logout', to: 'users#logout', as: :logout

  # Admin routes
  get 'admin/login', to: 'admins#login', as: :admin_login
  post 'admin/login', to: 'admins#login_submit', as: :admin_login_submit
  get 'admin/index', to: 'admins#index', as: :admin_dashboard
  get 'admin/show', to: 'admins#show', as: :admin_show

  # Customer routes
  get 'customer/login', to: 'customers#login', as: :customer_login
  post 'customer/login', to: 'customers#login_submit', as: :customer_login_submit
  get 'customer/index', to: 'customers#index', as: :customer_dashboard
  get 'customer/show/:uuid', to: 'customers#show', as: :customer_show
end
