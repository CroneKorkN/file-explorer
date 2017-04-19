class IndexController < ApplicationController
  def index
    @directory = Dir.entries('.')
    @path = ''
  end

  def path
    if File.directory?(params[:path])
      @directory = Dir.entries(params[:path])
      @path = "#{params[:path]}/"
      render :index
    elsif File.size(params[:path]) > 250_000
      send_file params[:path]
    else
      @file = File.read(params[:path])
      render :file
    end
  end

  def delete
    if File.directory?(params[:path])
      FileUtils.rm_rf(params[:path])
    else
      FileUtils.rm(params[:path])
    end
    head 204
  end
end
