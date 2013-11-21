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
    if @response && @response.length > 0
        @lat = @response["results"][0]["geometry"]["location"]["lat"]
        @lon = @response["results"][0]["geometry"]["location"]["lng"]

        @recent_2hr_array = Instagram.media_search(@response["results"][0]["geometry"]["location"]["lat"], @response["results"][0]["geometry"]["location"]["lng"],{count: 1, distance: 5000})
        @recent_2hr_array = @recent_2hr_array.to_json
        @recent_2hr_array = JSON.parse(@recent_2hr_array)

        if @recent_2hr_array && @recent_2hr_array.length > 0
          @first_photo = @recent_2hr_array[0]["images"]["low_resolution"]["url"]


            if @first_photo
                if @lat && @lon
                  Country.create!(name: @name, lat: @lat, lon: @lon, globe_photo: @first_photo)
                end
            else
              @first_photo = "https://lh3.ggpht.com/-gFbzXsG4uBs/UIF_GOs1teI/AAAAAAAAJq8/OWGj_MTx8hY/s1600/statue+2.png"
            end

            p "saved #{@formatted_name} / #{@lat} / #{@lon} / #{@first_photo}"

        end

    end
end
