class CountriesController < ApplicationController
  def index
  end

  def get_lat_lon
    @response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=taiwan&sensor=true")
    @response_json = @response.to_json
    render :json => @response_json
  end

end
