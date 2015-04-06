Rails.application.routes.draw do

	get 'home/index'

#  resources :academia

resources :treinos

 # resources :planos

 resources :medidas

match 'contact' => 'contact#new', :via => :get
match 'contact' => 'contact#create', :via => :post

 resources :home

 match 'painel/index'  => 'painel#index' , via: [:get]

 devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
 	registrations: 'registrations' }

 	root 'home#index'


 end
