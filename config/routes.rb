Rails.application.routes.draw do

  root "items#index"
  get "items/:id/purchase" => "items#purchase", as: "purchase"
  patch "items/:id/purchase_confirm" => "items#purchase_confirm", as: "purchase_confirm"
  get "items/:id/purchase/complete" => "items#complete", as: "purchase_complete"
  get "items/purchase/index" => "items#purchase_index", as: "purchase_index"
  get "items/:id/liked_users" => "items#liked_users", as: "liked_users"
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :relationships, only: [:create, :destroy]
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  resources :lessons, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :attendances, only: [:create, :destroy]
  end



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

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
