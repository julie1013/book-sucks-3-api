Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount Knock::Engine => "/knock"
    end
  end
end
