Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :players do
    resources :attendances
    resources :trainings
  end
  resources :leagues
  resources :trainings
  resources :attendances
end
