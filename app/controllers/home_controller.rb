class HomeController < ApplicationController

  def index
      # @instagram = Instagram.media_search("37.7808851","-122.3948632")
      # @insta_json = @instagram.to_json
  end

  def get_images
      # params[:lat], params[:lon]
      @instagram = Instagram.media_search(params[:lat], params[:lon],{count: 25}) #count max=25
      @insta_json = @instagram.to_json
      render :json => @insta_json

  end
end
