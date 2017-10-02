Rails.application.routes.draw do
	devise_for :users

	devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
	ActiveAdmin.routes(self)

	root "users#show"

	resources :users do
		member do
			get :my_account
		end
	end

	namespace :app do
		get "app_aboutus"
		get "app_service"
		get "app_locations"
		get "app_contact"
		get "app_version"
		get "app_qa"
	end

	# 開http://localhost:3000/letter_opener
	if Rails.env.development?
		mount LetterOpenerWeb::Engine, at: "/letter_opener"
	end

	scope :path => '/api/v1/', :defaults => { :format => :json }, :module => "api_v1", :as => 'v1' do

	    #auth
	    get "/users_test" => "auth#users_test"
	   	post "/login" => "auth#login"
	    post "/logout" => "auth#logout"
	    post "/register" => "auth#register"

	    post  "/reSendConfirmation" => "auth#reSendConfirmation"
	    post  "/sendResetPassword" => "auth#sendResetPassword"

	end
end
