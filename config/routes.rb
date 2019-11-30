Rails.application.routes.draw do

  resources :submissions
  root 'home#index'
  post 'login' => 'sessions#create'
  post 'signup' => 'users#create'

  get 'all_subject_info' => 'subjects#all_subject_info'
  get 'all_subject_names' => 'subjects#all_subject_names'

  resources :users
  resources :subjects
  resources :groups

  post 'reset_password/request_token' => 'reset_password#request_token'
  post 'reset_password/update_password/:verification_token' => 'reset_password#update_password'

  delete 'destroy_assessment' => 'assessments#destroy'
  put 'update_comments' => 'assessments#update_comments'
end
