Rails.application.routes.draw do

  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "end_user/registrations",
  sessions: 'end_user/sessions'
}



 scope module: :end_user do
   post '/guests/guest_sign_in', to: 'guests#new_guest'
   root to:'homes#top'
   get "/homes" => "homes#top"
   resources :end_users, only:[:index, :show, :edit, :update] do
     member do
      get :favorites
     end
   end
   #get "/end_users/favorites" => "end_users#favorites"
   resources :submissions do
     resources :comments,    only:[:create, :destroy]
     resource :favorites,    only:[:create, :destroy]
   end
   get "search" => "searches#search"
 end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
 get "homes" => "homes#top"
 resources :end_users,   only:[:index, :show, :edit, :update]
 resources :submissions, only:[:index, :show, :destroy] do
  resources :comments,    only:[:destroy]
 end
end

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
