Rails.application.routes.draw do

	get 'home/index'

#  resources :academia

resources :treinos

 # resources :planos

 resources :medidas

match 'contact' => 'contact#new', :via => :get
match 'contact' => 'contact#create', :via => :post

 resources :home

 match 'painel/index'  => 'painel#index' , via: [:get], as: :painel

 devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
 	registrations: 'registrations' },  :path_names => {:sign_in => 'login', :sign_out => 'logout',
 		:sign_up => 'signup'}

 		match "/users/sign_in", :to => redirect("/users/login"), via: [:get]
 		match "/users/sign_out", :to => redirect("/users/logout"), via: [:get]
 		match "/users/sign_up", :to => redirect("/users/signup"), via: [:get]

 	root 'home#index'


 end
