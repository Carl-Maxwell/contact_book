Rails.application.routes.draw do

  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: [:index] do
      resource :favorites, only: [:create, :destroy]
    end

    resources :comments, only: [:index, :create, :destroy]
  end

  resources :contacts, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:index, :create, :destroy]
  end
  resources :contact_shares, only: [:create, :destroy]

# get '/users' =>         'users#index'
# post '/users' =>        'users#create'
# get '/users/new' =>     'users#new', as: :new_user
# get 'users/:id/edit' => 'users#edit', as: :edit_user
# get 'users/:id' =>      'users#show', as: :user
# patch 'users/:id' =>    'users#update'
# put 'users/:id' =>      'users#update'
# delete 'users/:id' =>   'users#destroy'

end
