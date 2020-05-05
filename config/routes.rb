Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  
  get 'home/index'

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  # Создаём маршруты для единичного ресурса (resource)
  resource :contacts, only: [:new, :create], path_names: { :new => '' }
  #                    только new и create маршруты 
  #                                          маршрут new перенаправить на ''   ???

  # Создаём маршруты для множественного ресурса (resources)
  resources :articles do    # Каждой статье будет определён ...
    # resources :comments, only: [:create]
    resources :comments     # ... полный комплект маршрутов для коментариев
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
