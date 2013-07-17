CancanSample::Application.routes.draw do
  resources :diaries


  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'login'  => 'sessions#new',     as: 'login'
  get 'signup' => 'users#new',        as: 'signup'

  resources :users    # TODO resourcesに制限が必要ではないか？
  resources :sessions # TODO resourcesに制限が必要ではないか？

  get 'secret' => 'home#secret',      as: 'secret'
  root to: 'home#index'
end
