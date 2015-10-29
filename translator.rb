require 'yaml'
require 'base64'

def list
	puts """
	As of now Translation Center is able to translate from: 
	
	>Russian
	>Spanish
	>Arabic
	>Pashto
	>French
	
	It is also able to translate to: 
	
	>Base64
	>Binary
	
	Please choose from the list above by typing in the name of the language you would like to translate to: 
	"""
	input = gets.chomp!
	case
	when /base64/i
		base64
	when /binary/i
		binary
	when /spanish/i
		translate
	when /russian/i
		translate
	when /arabic/i
		translate
	when /pashto/i
		translate
	when /french/i
		translate
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
	puts "Enter your text:"
	text = gets.chomp
	puts "#{text} in binary is: #{text.unpack('b*')}"
end

def base64
	puts "Enter the text you want translated to Base64:"
	input = gets.chomp!.to_s
	new_string = "#{input}"
	puts "'#{input}' in Base64 is: #{Base64.encode64(new_string)}"	
end
base64
