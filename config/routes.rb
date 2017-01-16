Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/oauth/redirect', to: 'oauth#redirect', as: 'redirect'
  post '/command/boobot', to: 'command#boobot', as: 'command'
  root :to => 'index#index', as: 'root'

end
