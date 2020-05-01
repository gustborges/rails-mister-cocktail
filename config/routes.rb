Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:create]
  end
  # get ':id', to: 'cocktails#show'
  root to: 'cocktails#index'
  resources :doses, only: [:destroy]
end
