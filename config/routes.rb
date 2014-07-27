Meetapp::Application.routes.draw do


  resources :events do 
    resources :comments
    resources :invitations do
      member do
        post :accept_invitation
        post :decline_invitation
      end
    end
    member do
      post :cancel
    end
  end



  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations' }

  resources :friendships, only: [:create] do
    member do
      post :accept_invitation
      post :decline_invitation
      post :revoke
    end
  end

  devise_scope :user do
    resources :users, only: [:show, :index] do
      # member do 
      #   post   :befriend
      #   delete :unfriend
      # end
    end
    match 'profile' => 'users#profile', via: :get
    match 'friends' => 'users#friends', via: :get
    match 'invitations' => 'users#invitations', via: :get
    match "search", to: "users#search", via: [:get, :post], as: :search
    root 'devise/sessions#new'
  end

  
end
