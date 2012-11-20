Trevorvideo::Application.routes.draw do
  root :to => "videos#index"
  resources :videos, only: :index
  resources :people, only: :show
end
