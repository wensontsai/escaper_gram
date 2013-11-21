# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
countriesPath = "#{Rails.root}/public/world-countries.json"
countries = JSON.parse(File.read(countriesPath))


countries["features"].each do |country|
  @name = country["properties"]["name"]
  @formatted_name = @name.gsub(/\s+/, "%20")

  @response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + @formatted_name + "&sensor=true")
  @response = @response.to_json
  @response = JSON.parse(@response)

  @recent_2hr_array = Instagram.media_search(@response["results"][0]["geometry"]["location"]["lat"], @response["results"][0]["geometry"]["location"]["lng"],{count: 1, distance: 5000})
  @recent_2hr_array = @recent_2hr_array.to_json
  @recent_2hr_array = JSON.parse(@recent_2hr_array)


  if @response["results"][0]["geometry"]["location"]["lat"] && @response["results"][0]["geometry"]["location"]["lng"]
    Country.create!(name: country["properties"]["name"], lat: @response["results"][0]["geometry"]["location"]["lat"], lon: @response["results"][0]["geometry"]["location"]["lng"], globe_photo: @recent_2hr_array[0]["images"]["low_resolution"]["url"])
  p "saved #{@formatted_name} / #{@response["results"][0]["geometry"]["location"]["lat"]} / #{@response["results"][0]["geometry"]["location"]["lng"]} / #{@recent_2hr_array[0]["images"]["low_resolution"]["url"]}"
  else
  p "#{formatted_name} is bunk"
  end






end
