Rails.application.routes.draw do
  resources :categories

  resource :session
  
  get 'signup' => 'users#new'
  resources :users

  root "events#index"

  #get "events/past"   => "events#index", scope: "past"
  #get "events/free"   => "events#index", scope: "free"
  #get "events/recent" => "events#index", scope: "recent"
  
  # %w(past free recent).each do |scope|
  #   get "events/#{scope}" => "events#index", scope: scope
  # end
  
  # get 'events/:scope' => "events#index", constraints: { scope: /past|free|recent/ }
  
  get 'events/filter/:scope' => "events#index", as: :filtered_events
  
  resources :events do
    resources :registrations
    resources :likes
  end
end
