Rails.application.routes.draw do

	devise_for :users

	devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
	ActiveAdmin.routes(self)

	root "welcome#index"

	# 開http://localhost:3000/letter_opener
	if Rails.env.development?
		mount LetterOpenerWeb::Engine, at: "/letter_opener"
	end

end
