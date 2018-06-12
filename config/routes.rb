Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope path: 'api/v1' do

    resources :pages, only: :index
    resources :accounts
    resources :transfers
    get 'matrix', to: 'accounts#matrix'
    get 'branch/:id', to: 'accounts#branch'

    resources :peoplepfs, :peoplepjs do
      resources :accounts, only: :index
    end

  end
end
