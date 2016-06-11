Rails.application.routes.draw do

  get 'questions/create'

  root to: 'home#index'

  get 'about' => 'home#about'

  devise_for :mentors
  devise_for :students

  resources :skills
  resources :bookmarks
  resources :students, only: [:index, :show] do
    resources :appointments, only: [:index, :show, :new]
  end

  resources :questions, only: [:create]

end
