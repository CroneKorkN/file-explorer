class IndexController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    raise ActionController::RoutingError, 'Not Found' unless 
      File.exists?(@absolute_path)
    raise ArgumentError, 'Should not be parent of root' unless 
      @absolute_path.starts_with?(current_directory)
  end
  
  def show
    
  end
  
  def new
  end

  def create
    uploaded_io = params[:file]
    @absolute_path = check_path(unscoped(params[:path]))
    File.open(Rails.root.join(@absolute_path, uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to scoped(@absolute_path)
  end

  def path
  end

  def delete
    absolute_path = check_path(unscoped(params[:path]))
    if File.directory?(absolute_path)
      FileUtils.rm_rf(absolute_path)
    else
      FileUtils.rm(absolute_path)
    end
    redirect_to scoped(@absolute_path.split("/")[0..-2].join("/"))
  end
end
