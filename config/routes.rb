Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  get '/home', to: 'static#home'
  get '/index', to: redirect('/')
  get '/shop', to: 'static#shop', as: 'shop'
  get '/contact', to: 'static#contact'
  get '/product_details/:id', to: 'static#product_details', as: 'product_details'
  post '/add_to_cart', to: 'static#add_to_cart', as: 'add_to_cart'
  get '/cart', to: 'static#cart', as: 'cart'

  scope '/admin' do
    root to: "products#index"
    resources :products
    resources :orders
  end
end
