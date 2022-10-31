Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :tasks
  end
  get "/today", to: "tasks#due_today"
  get "/overdue", to: "tasks#overdue"
  get "/futuretask", to: "tasks#futuretask"
end
