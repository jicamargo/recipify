Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/custom_sign_out" => "devise/sessions#destroy", as: :custom_destroy_user_session
  end

  resources :recipe_foods
  resources :foods 
  resources :recipes
  get 'recipes_public', to: 'recipes#public_list', as: 'recipes_public_list'
  patch 'recipes/:id/update_public', to: 'recipes#update_public', as: 'update_public'

  resources :users
  resources :foods do
    member do
      delete 'delete', to: 'foods#destroy', as: 'delete'
    end
  end

  # Defines the root path route ("/")
  root 'foods#index'

  resources :shopping_list, only: [:index]

end
