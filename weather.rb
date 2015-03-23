require "yahoo_weatherman"
puts
puts "Enter your location via your zip code"
zip = gets.chomp
client = Weatherman::Client.new
weather = client.lookup_by_location(zip).condition['temp']
condition = client.lookup_by_location(zip).condition['text']
weather = weather.to_i
weather = weather * 9 / 5 + 32
puts
puts "Your current temperature is #{weather} degrees Farenheit with #{condition} conditions."
new_weather = client.lookup_by_location(zip)
puts
forecast = client.lookup_by_location(zip).forecasts
today = Time.now.strftime("%w").to_i
tomorrow = Time.now.strftime("%w").to_i + 1

forecast.each{ |item|
	low = item["low"] * 9 / 5 + 32
	high = item["high"] * 9 / 5 + 32
	day = item["day"]
	weekday = item["date"]
	day_of_week = weekday.strftime("%w").to_i
	#puts day_of_week
	text = item["text"]
	#puts item["date"]
	
	if day_of_week == today
		day = "Today"
	elsif day_of_week == tomorrow
		day = "Tomorrow"
	end
	puts "#{day} will be #{text}.  The low temp will be #{low} and the high will be #{high}."
	puts
}
