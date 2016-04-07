Rails.application.routes.draw do
  devise_for :mentors
  devise_for :students
  resources  :skills
  resources  :bookmarks

  post :incoming, to: 'incoming#create'
  get 'home/index'
  get 'home/about'
  root to: "home#index"
end
