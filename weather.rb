#require "open-uri"
#require "nokogiri"
require "yahoo_weatherman"

puts "Enter your location via your zip code"
zip = gets.chomp
client = Weatherman::Client.new
weather = client.lookup_by_location(zip).condition['temp']
condition = client.lookup_by_location(zip).condition['text']
weather = weather.to_i
weather = weather * 9 / 5 + 32
puts "Your current temperature is #{weather} degrees Farenheit with #{condition} conditions."
puts
new_weather = client.lookup_by_location(zip)
#new_weather.methods.each{
#	|meth| puts meth
#}
puts
forecast = client.lookup_by_location(zip).forecasts
today = Time.now.strftime("%w").to_i
tomorrow = Time.now.strftime("%w").to_i + 1
forecast.each{ |item|
	low = item["low"]
	high = item["high"]
	day = item["day"]
	text = item["text"]
	puts item["date"]
}
