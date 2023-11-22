Rails.application.routes.draw do
  devise_for :users

    authenticated :user do
      root 'foods#index', as: :authenticated_root
    end

    authenticated :user do
      'recipes#index'
    end

    unauthenticated :user do
      root 'home#index', as: :unauthenticated_root
    end


  resources :foods, except: [:update]
  resources :recipes, except: [:update]

  get "up" => "rails/health#show", as: :rails_health_check

end
