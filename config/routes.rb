Rails.application.routes.draw do
  routes = ->{
    get '/upload', to: 'index#new'
    post '/', to: 'index#create'
    get '/', to: 'index#index'
    get '/:path', to: 'index#path', constraints: { path: /.+/ }
    delete '/:path', to: 'index#delete', constraints: { path: /.+/ }
  }
  if ENV['URL_SCOPE']
    scope "/#{ENV['URL_SCOPE']}" do
      routes.call
    end
  else
    routes.call
  end
end
