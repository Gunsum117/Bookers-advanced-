Rails.application.routes.draw do

	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :users
	resources :books

	get "users/:id" => "users#show", as: :mypage

	root :to => "users#top"
	get "home/about" => "users#home"


end

