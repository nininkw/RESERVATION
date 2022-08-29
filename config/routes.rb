Rails.application.routes.draw do
  get 'home/top'
  root to: "home#top"

  devise_for :users, 
  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 
  resources :users 
  
  resources :room_posts do
    get "search", on: :collection
  end
  resources :reservations do
    post "reservations/confirm", on: :collection
  end

end
