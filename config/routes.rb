Rails.application.routes.draw do

  get 'home/index'

  resources :academia

  resources :exercicios

  resources :tp_exercicios

  resources :treinos

  resources :planos

  resources :medidas

  resources :home

  match 'painel/index'  => 'painel#index' , via: [:get]

  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  
    root 'home#index'


end
