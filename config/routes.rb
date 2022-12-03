Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/parse_images', to: 'image_parser#parse_images'
  post '/parse_images', to: 'image_parser#parse_images_perform'
end
