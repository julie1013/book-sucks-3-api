Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount Knock::Engine => '/knock'
      get '/userinfo' => 'users#get_info'
      get '/books' => 'books#index'
      get '/getList' => 'books#get_list'
      post '/addToList' => 'books#add_to_list'
      get '/removeFromList' => 'books#remove_from_list'
      get '/getReviews' => 'books#get_reviews'
      get '/deleteYourReview' => 'books#delete_review'
      post '/addReview' => 'books#add_review'
      post '/editYourReview' => 'books#edit_review'
    end
  end
end
