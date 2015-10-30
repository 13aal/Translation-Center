=begin
Editor: Ekultek

Translation Center

Date: 10/30/15
=end

require 'yaml'
require 'base64'

def list
	puts """
	As of now Translation Center is able to translate from: 
	
	1: Russian
	2: Spanish
	3: Arabic
	4: Pashto
	5: French
	
	Translation Center is also able to translate into: 
	
	6: Base64
	7: Binary
	
	Please choose from the list above by typing in the number in front of the language: 
	"""
	input = gets.chomp!
	case
	when input == "1"
		translate
	when input == "2"
		translate
	when input == "3"
		translate
	when input == "4"
		translate
	when input == "5"
		translate
	when input == "6"
		base64
	when input =="7"
		binary
	else
		puts "Invalid input, redirecting..."
		return
	end
end

def welcome
	puts "Welcome to the Translation Center! To begin press 'B', to exit the program press 'Q'. To see a list of languages available to translate type 'list:'"
	input = language = gets.chomp!
	if language =~ /b/i
		translate
	elsif language =~ /q/i
		exit
	elsif language =~ /list/i
		list
	else
		puts "Invalid input redirecting..."
		welcome
	end
end

def translate
	translations = YAML.load_file 'words.yml'
	puts "Enter what language you want to translate from:"
	input = language = gets.chomp
	puts "Enter word or phrase to be translated to English, press 'Q' to quit:"
	input = gets.chomp
	if translations[input]
		puts "The translation of '#{input}', from #{language} to English is: '#{translations[input]}'"
	elsif input =~ /q/i
		return
	else
		puts "Invalid word or phrase redirecting..."
		translate
	end
end

def binary
	puts "Enter your text you wanted translated to binary:"
	text = gets.chomp
	puts "#{text} in binary is: #{text.unpack('b*')}"
end

def base64
	puts "Enter the text you want translated to Base64:"
	input = gets.chomp!.to_s
	new_string = "#{input}"
	puts "'#{input}' in Base64 is: #{Base64.encode64(new_string)}"	
end
welcome
