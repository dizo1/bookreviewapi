Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #scope :api, defaults: { format: :json } do
  #  scope :v1 do
  #    devise_scope :user do
   #     post "sign_up", to: "registration#create"
   #   end
  #  end
  #end
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        devise_scope :user do
          post "sign_up", to: "registrations#create"
          post "sign_in", to: "sessions#create"
          delete "log_out", to: "sessions#destroy"
      end
    end
  end
end