Rails.application.routes.draw do
  namespace ENV['URL_SCOPE'].to_sym do
    get '/upload', to: 'index#new'
    post '/', to: 'index#create'
    get '/', to: 'index#index'
    get '/:path', to: 'index#path', constraints: { path: /.+/ }
    delete '/:path', to: 'index#delete', constraints: { path: /.+/ }
  end
end
