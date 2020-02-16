Rails.application.routes.draw do
  get 'activity_logs/index'
  get 'activity_logs/create'
  get 'activity_logs/show'
  get 'activity_logs/update'
  get 'assistants/index'
  get 'activities/index'
  get 'babies/index'
  get 'babies/show'
  get 'babies/new'
  get 'babies/edit'
  get 'babies/create'
  get 'babies/update'
  get 'babies/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
