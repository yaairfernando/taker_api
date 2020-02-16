Rails.application.routes.draw do
  namespace 'api' do
    resources :babies, only: %i[index]
    resources :activities, only: %i[index]
    resources :assistants, only: %i[index]
    resources :activity_logs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
