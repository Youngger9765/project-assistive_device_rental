Rails.application.routes.draw do

	devise_scope :user do
    get "/register", :to => "users/registrations#new", as: :new_registration
    post "/users(.:format)", :to => "users/registrations#create", as: :create_registration

    post "/users/sign_in(.:format)", :to => "users/sessions#create", as: :create_session

    get '/users/edit(.:format)', :to => "users/registrations#edit", as: :edit_registered_user
  end

	devise_for :users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)

	root "welcome#index"

  


end
