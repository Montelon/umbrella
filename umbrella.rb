p "Where are you located?"


user_location = gets.chomp

p user_location

require "open-uri" #ALLOWS US TO READ PAGES 

gmaps_api_url="https://maps.googleapis.com/maps/api/geocode/json?address=" +  user_location +"&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"#string to the URL you want to open goes in paranthese 

raw_gmaps_data = URI.open(gmaps_api_url).read

require "json" #APIs are in this format. Turns into a HASH

parsed_gmaps_data = JSON.parse(raw_gmaps_data)
 
results_array = parsed_gmaps_data.fetch("results")

first_results = results_array.at(0)

 first_results.fetch("geometry")

geometry = first_results.fetch("geometry")

second_results = geometry.fetch("location")

p lat = second_results.fetch("lat")
p lng = second_results.fetch("lng")





# p "Where are you located?"
# user_location = gets.chomp

# p user_location

# require "open-uri" #ALLOWS US TO READ URL PAGES 

darksky_api_url="https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/" + lat.to_s+","+lng.to_s #string to the URL you want to open goes in paranthese 

# darksky_api_url="https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/#{lat},#{lng}"

raw_darksky_data = URI.open(darksky_api_url).read

# require "json" #APIs are in this format. Turns into a HASH

parsed_darksky_data = JSON.parse(raw_darksky_data)

hourly_results_hash = parsed_darksky_data.fetch("hourly")

precip_prob = hourly_results_hash.fetch("data")

first_hour = precip_prob.at(0)
second_hour = precip_prob.at(1)
third_hour = precip_prob.at(2)
fourth_hour = precip_prob.at(3)
fifth_hour = precip_prob.at(4)
sixth_hour = precip_prob.at(5)
seventh_hour = precip_prob.at(6)
eighth_hour = precip_prob.at(7)
ninth_hour = precip_prob.at(8)
tenth_hour = precip_prob.at(9)

 p first_hour.fetch("precipProbability")
 p second_hour.fetch("precipProbability")
 p third_hour.fetch("precipProbability")
 p fourth_hour.fetch("precipProbability")
 p fifth_hour.fetch("precipProbability")
 p sixth_hour.fetch("precipProbability")
 p seventh_hour.fetch("precipProbability")
 p eighth_hour.fetch("precipProbability")
 p ninth_hour.fetch("precipProbability")
 p tenth_hour.fetch("precipProbability")

 if  first_hour.fetch("precipProbability") >= 0.10 || second_hour.fetch("precipProbability") >= 0.10 || third_hour.fetch("precipProbability") >= 0.10 || fourth_hour.fetch("precipProbability") >= 0.10 || fifth_hour.fetch("precipProbability") >= 0.10 || sixth_hour.fetch("precipProbability") >= 0.10 || seventh_hour.fetch("precipProbability") >= 0.10 || eighth_hour.fetch("precipProbability") >= 0.10 || ninth_hour.fetch("precipProbability") >= 0.10 || tenth_hour.fetch("precipProbability") >= 0.10

  p "Bring an umbrella "
 end 
