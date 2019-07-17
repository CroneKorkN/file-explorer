Rails.application.routes.draw do
  routes = ->{
    get '/_upload', to: 'index#new', as: :upload
    post '/', to: 'index#create'
    get '/', to: 'index#index'
    get '/:path', to: 'index#path', constraints: { path: /.+/ }
    delete '/:path', to: 'index#delete', constraints: { path: /.+/ }
  }
  ENV['URL_SCOPE'] ? scope("/#{ENV['URL_SCOPE']}"){routes.call} : routes.call
end
