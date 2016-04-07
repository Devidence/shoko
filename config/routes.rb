Rails.application.routes.draw do
  root to: 'home#index'
  
  get 'about' => 'home#about'
  
  devise_for :mentors
  devise_for :students
  
  resources  :skills
  resources  :bookmarks

  post :incoming, to: 'incoming#create'
end
