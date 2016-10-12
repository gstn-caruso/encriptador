Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/desencriptar', to: 'welcome#desencriptar'
  get '/encriptar', to: 'welcome#index'

  post '/encriptar', to: 'welcome#encriptar_datos'
  post '/desencriptar', to: 'welcome#desencriptar_datos'
end
