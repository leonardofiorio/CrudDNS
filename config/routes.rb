Rails.application.routes.draw do

  resources :domains
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'domains/new/:id', to: 'domains#new'

end
