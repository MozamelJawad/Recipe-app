Rails.application.routes.draw do
  devise_for :users

    authenticated :user do
      root 'foods#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'home#index', as: :unauthenticated_root
    end


  resources :foods, except: [:update]
  resources :recipes do
    member do
      patch 'toggle_public'
    end
  resources :recipe_foods
  end

  get 'public_recipes' => 'recipes#public_recipes', as: :public_recipes

  get "up" => "rails/health#show", as: :rails_health_check

end
