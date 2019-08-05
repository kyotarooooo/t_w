Rails.application.routes.draw do

  root "items#index"
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :lessons, only: [:new, :create, :index, :show]



  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
