# frozen_string_literal: true

Rails.application.routes.draw do
  resources :product do
    resources :charges, only: [:create]
  end
  post "/stripe/webhooks", to: "stripe#webhooks"
  post "/stripe/subscribe_for_plan/:id", to: "subscriber#create"
  resources :category, only: [:index]
  post "seller_profile/stripe_oauth", to: "seller_profile#stripe"
  mount_devise_token_auth_for "User", at: "auth", skip: [:registrations]
  mount_devise_token_auth_for "Seller", at: "auth_seller", skip: [:confirmations, :passwords, :sessions, :unlocks]
  mount_devise_token_auth_for "Customer", at: "auth_customer", skip: [:confirmations, :passwords, :sessions, :unlocks]

  devise_scope :seller do
    resources :seller_profile, only: [:update]
    resources :plan, only: [:index]
  end
  devise_scope :customer do
    resources :customer_profile, only: [:update]
  end
end
