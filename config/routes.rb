Rails.application.routes.draw do
	devise_for :users

	devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
	ActiveAdmin.routes(self)

	root "welcome#index"

  namespace :app do
    get "app_aboutus"
    get "app_service"
    get "app_locations"
    get "app_contact"
    get "app_version"
    get "app_qa"
  end

  get "app/app_products/:id" => "app#app_product"

	# 開http://localhost:3000/letter_opener
	if Rails.env.development?
		mount LetterOpenerWeb::Engine, at: "/letter_opener"
	end
end
