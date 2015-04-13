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
 	registrations: 'registrations' },  :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup'}

 	root 'home#index'


 end
