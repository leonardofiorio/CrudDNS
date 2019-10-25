Rails.application.routes.draw do

  resources :records
  resources :domains
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'domains/new/:id', to: 'domains#new'

  # Ciração de rota para a criação de um novo record com domain pré-selecionado
  get 'records/new/:id_domain', to: 'records#new'

  root to: "domains#index"

end
