Rails.application.routes.draw do

  devise_for :users

  root to: 'welcome#index'

  resource :bookings, only: [:new, :create, :show]
  resource :contacts, only: [:new, :create, :show]
  resource :abouts, only: [:show],  path_names: { :show => '' }
  # For details on the DSL available within this fileshow see https://guides.rubyonrails.org/routing.html
end
