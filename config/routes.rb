Rails.application.routes.draw do

  devise_for :users

  root to: 'welcome#index'

  resource :bookings, only: [:new, :create, :show]
  resource :contacts, only: [:new, :create, :show]
  resource :abouts, only: [:show],  path_names: { :show => '' }

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resource :roles
    resources :users

    resources :bookings

    resources :locations
    resources :services
    resources :hairdressers

    resources :contacts

  end

  match "/404", to: 'errors#not_found', via: :all
  match "/500", to: 'errors#internal_server_error', via: :all

end
