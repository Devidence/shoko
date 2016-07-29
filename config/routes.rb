Rails.application.routes.draw do

  root to: 'home#index'

  get 'about' => 'home#about'

  devise_for :mentors
  devise_for :students

  resources :skills
  resources :bookmarks

  namespace :mentoring do
    resources :students, only: [:index, :show] do
      resources :appointments, only: [:show, :new, :create] do
        get :record
        post :conclude
      end
    end
    resources :appointments, only: [:index]
    resources :questions, only: [:create, :destroy]
  end


end
