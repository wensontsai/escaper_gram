class CountriesController < ApplicationController
  def index
  end

  def get_lat_lon
    country_name = params[:name]
    @response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + country_name + "&sensor=true")
    @response_json = @response.to_json
    render :json => @response_json
  end

  def country_pictures
    render :json => Country.where("globe_photo IS NOT NULL").map {|c| [c.name, c.globe_photo]}
  end


end
