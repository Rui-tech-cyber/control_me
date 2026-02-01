Rails.application.routes.draw do
  get "memo/edit"
  get "memo/update"
  get "entries/new"
  get "entries/create"
  root "entries#new"

  resources :entries, only: [:new, :create, :show, :index] do
    resource :memo, only: [:edit, :update]
  end
end
