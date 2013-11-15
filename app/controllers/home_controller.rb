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

  # def get_images_2_hrs_ago
  #     @instagram = Instagram.media_search(params[:lat], params[:lon],{max_timestamp: 2.hours.ago.to_i}) #count max=25
  #     @insta_json = @instagram.to_json
  #     render :json => @insta_json
  # end

  def get_images_x_hrs_ago
    min_time = (params[:hours_ago].to_i+2).hours.ago.to_i
    max_time = (params[:hours_ago].to_i).hours.ago.to_i
      @instagram = Instagram.media_search(params[:lat], params[:lon],{max_timestamp: max_time, min_timestamp: min_time}) #count max=25
      @insta_json = @instagram.to_json
      render :json => @insta_json
  end

end
