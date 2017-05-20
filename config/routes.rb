Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups do
    resources :posts
    resources :group_members, only: [:create, :destroy]
  end
  root 'groups#index'
end
