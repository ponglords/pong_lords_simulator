PongLordsSimulator::Application.routes.draw do
  root 'welcome#index'
  resources :players, only: [:index]
  resources :matches, only: [:new, :create]
  resources :doubles, only: [:new, :create]
  delete 'reset', to: 'reset#destroy'
end
