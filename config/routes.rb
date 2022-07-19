Rails.application.routes.draw do

  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "end_user/registrations",
  sessions: 'end_user/sessions'
}
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
