Trevorvideo::Application.routes.draw do
  root :to => "videos#index"
  resource :videos, only: :index
  resource :people, only: :show
end
