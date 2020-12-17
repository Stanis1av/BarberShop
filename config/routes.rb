Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resource :location, only: [:new, :create, :show]
  resource :booking, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
