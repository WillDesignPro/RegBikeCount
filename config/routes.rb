Rails.application.routes.draw do
  resources :step_counters, only: :none do
    get :save, param: :pressure, on: :collection
  end
end
