Rails.application.routes.draw do
  devise_for :mentors
  devise_for :students
  resources  :skills
  resources  :bookmarks
  
  get 'home/index'
  get 'home/about'
  root to: "home#index"
end
