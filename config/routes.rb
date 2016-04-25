Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root to: 'statics#home_page'

  resources :choices
  resources :questions
  resources :quizzes

  get '/quizzes/select/quiz/:id', to: 'quizzes#select_quiz', as: 'select_quiz'
  delete '/quizzes/deselect/quiz', to: 'quizzes#deselect_quiz', as: 'deselect_quiz'
  
  devise_for :users, controllers: { 
    sessions: "users/sessions", 
    registrations: 'users/registrations' 
  }

  get '/quizzes/:id/answers', to: 'quizzes#answers', as: 'answers_quiz'
  get '/quizzes/:id/clean', to: 'quizzes#clean', as: 'clean_quiz'
  post '/quizzes/:id/answer', to: 'quizzes#answer', as: 'answer_quiz'

end
