class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  ENV['BASE_DIRECTORY']
  ENV['URL_SCOPE']
end
