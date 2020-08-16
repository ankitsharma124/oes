Rails.application.routes.draw do
  devise_for :logins
  resources :homes
  resources :standards
  resources :students
  resources :subjects
  resources :tests do
    collection { post :import }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
