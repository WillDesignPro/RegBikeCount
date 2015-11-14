Rails.application.routes.draw do
  resources :step_counters, only: :index do
    get '/save/:pressure', action: :save, on: :collection
  end

  root 'step_counters#index'
end
