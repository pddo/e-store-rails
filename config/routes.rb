Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  get '/home', to: 'static#home'
  get '/index', to: redirect('/')
  get '/contact', to: 'static#contact'

  scope '/admin' do
    root to: "products#index"
    resources :products
  end
end
