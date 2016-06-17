Rails.application.routes.draw do



  resources :sessions, only: [:new, :create] do
     delete :destroy, on: :collection
   end
  resources :aausers, only:[:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions do
    # this will define a route that will be `/questions/search` and it will
   # point to the questions controller `search` action in that controller.
   # on: :collection makes the route not have an `id` or `question_id` on it
    get :search, on: :collection
    # this will generate a route `/questions/:id/flag` and it will point to
    # questions controller `flag` action.
    # on: :member makes the route include an `:id` in it similar to the `edit`
    post :flag, on: :member

    post :mark_done

    # will will make all the answers routes nested within `questions` which
    # means all the answers routes will be prepended with `/questions/:question_id`
    resources :answers, only: [:create, :destroy]

  end

  # this defines a rount that specifies if we get a request the has a GET HTTP
  #verb with '/about' url
  get "/about" => "home#about"
  # get ({"/" => "home#index"})
  # passing the `as:` option enables us to have a url/path helper for this route
    # note that helpers are only for the URL portion of the route and has nothing
    # to do with the HTTP Verb. Also, note that a URL helper must be unique
  get "/greet/:name" => "home#greet", as: :greet
  root "home#index"
  # same as above if has root "/" page
  get "/cowsay" => 'cowsay#index'
  post "/cowsay" => 'cowsay#create', as: :sumbit_cowsay
  get '/temp'  => "tempcon#index"
  post '/temp' => "tempcon#convert", as: :convert
  get  '/bill'  => 'bill#index'
  post '/bill'  => 'bill#split'
   get  '/namepicker'    => 'namepicker#index'
   post '/namepicker'    => 'namepicker#pick'

    # resources :questions
   #
  #  get "questions/new"   =>  "questions#new",      as: :new_questions
  #  post "/questions"     =>  "questions#add",      as: :questions
  #  get  "/questions/:id" =>  "questions#show",     as: :question
  #  get '/questions'      =>  "questions#index"
  #  get "/questions/:id/edit" => "questions#edit",   as: :edit_questions
  #  patch "/questions/:id"   =>  "questions#update"
  #  delete "/questions/:id"      => "questions#destroy"


  resources :thems
  resources :articles
  resources :posts
  resources :posts
  resources :posts

end
