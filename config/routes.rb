Trevorvideo::Application.routes.draw do
  root :to => "videos#index"
  resources :videos, only: :index
  match '/:name' => "people#show", as: :find_person
end
