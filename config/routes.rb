Rails.application.routes.draw do
  get 'main/home'
  get 'main/scrape'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#home'
end
