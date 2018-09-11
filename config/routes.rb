Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]    
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page'
  get 'products/index'
  get 'products/new'
  get 'products/edit'
  get 'products/show'  
  get 'orders/index'    
  get 'orders/show'      
#  root 'simple_pages#index'   
  root 'simple_pages#landing_page'    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
