Rails.application.routes.draw do
  devise_for :users
  get 'about' => 'welcome#about'
  root to: 'welcome#index'
  
  post :incoming, to: 'incoming#create'
  
  resources :topics do 
    resources :bookmarks, except: [:index] do
     resources :likes, only: [:create, :destroy]
    end
  end
  
end
