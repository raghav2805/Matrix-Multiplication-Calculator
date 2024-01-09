Rails.application.routes.draw do
  get 'index', to: 'matrix_calculator#index'
  get 'calculate', to: 'matrix_calculator#calculate'
  post 'calculate', to: 'matrix_calculator#calculate'
end
