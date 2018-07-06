# frozen_string_literal: true

Rails.application.routes.draw do

  mount_devise_token_auth_for "User", at: "auth", skip: [:registrations]
  mount_devise_token_auth_for "Seller", at: "auth_seller", skip: [:confirmations, :passwords, :sessions, :unlocks]
  mount_devise_token_auth_for "Customer", at: "auth_customer", skip: [:confirmations, :passwords, :sessions, :unlocks]

  devise_scope :seller do
    resources :seller_profile, only: [:create, :update]
  end
  devise_scope :customer do
    resources :customer_profile, only: [:create, :update]
  end
end
