
Rails.application.routes.draw do
  root to: 'taskies#index'
  
  resources :taskies
end
