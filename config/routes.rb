Rails.application.routes.draw do

  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "end_user/registrations",
  sessions: 'end_user/sessions'
}

  scope module: :end_user do
   root to:'homes#top'
   get "/homes" => "homes#top"
   resources :end_users,   only:[:show, :edit, :update]
   resources :submissions do
   resources :comments,    only:[:create]
   end
   resources :favorites,   only:[:index]


  end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  get "homes" => "homes#top"
 resources :end_users, only:[:index, :show, :edit, :update]
 resources :submissions, only:[:index, :show, :destroy]

end

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
