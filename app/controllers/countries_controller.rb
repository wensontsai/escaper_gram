class CountriesController < ApplicationController
  def index
  end

  def get_lat_lon
    country_name = params[:name]
    @response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + country_name + "&sensor=true")
    @response_json = @response.to_json
    render :json => @response_json
  end

  def get_all_lat_lon


  end

end
