Rails.application.routes.draw do
  resources :contacts, only: [:index, :new, :create, :show, :destroy]
end
