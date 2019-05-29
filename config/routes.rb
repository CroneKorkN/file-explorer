Rails.application.routes.draw do
  scope "/#{ENV['URL_SCOPE']}" do
    get '/upload', to: 'index#new'
    post '/', to: 'index#create'
    get '/', to: 'index#index'
    get '/:path', to: 'index#path', constraints: { path: /.+/ }
    delete '/:path', to: 'index#delete', constraints: { path: /.+/ }
  end
end
