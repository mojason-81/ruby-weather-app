require "yahoo_weatherman"

puts "Enter your location via your zip code"
zip = gets.chomp
client = Weatherman::Client.new
weather = client.lookup_by_location(zip).condition['temp']
condition = client.lookup_by_location(zip).condition['text']
weather = weather.to_i
weather = weather * 9 / 5 + 32
puts "Your current temperature is #{weather} degrees Farenheit with #{condition} conditions."
