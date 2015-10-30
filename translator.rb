=begin
Editor: 13aal

Translation Center

Date: 10/30/15
=end

require 'yaml'
require 'base64'
require 'digest'

def welcome_list
	puts """
	Welcome to Translation Center! Below you will find a list of available(so far) features, more feautures are being added as we speak! Have fun and enjoy!

	As of now Translation Center is able to translate from: 
	
	1: Russian
	2: Spanish
	3: Arabic
	4: Pashto
	5: French
	
	Translation Center is also able to translate into: 
	
	6: Base64
	7: Binary
	8: MD5
	
	Please choose from the list above by typing in the number in front of the language: 
	"""
	input = gets.chomp!
	case input.to_i
	when 1
		translate
	when 2
		translate
	when 3
		translate
	when 4
		translate
	when 5
		translate
	when 6
		base64
	when 7
		binary
	when 8
		md5
	else
		puts "Invalid input, redirecting..."
		return
	end
end

def translate
	translations = YAML.load_file 'words.yml' 
	puts "Enter word or phrase to be translated to English, press 'Q' to quit:"
	input = gets.chomp
	if translations[input]
		puts "The translation of '#{input}' to English is: '#{translations[input]}'"
	elsif input =~ /q/i
		list
	else
		puts "Invalid word or phrase redirecting..."
		translate
	end
end

def binary
	puts "Enter your text you wanted translated to binary:"
	text = gets.chomp
	puts "#{text} in binary is: #{text.unpack('b*')}"
	binary if restart
end

def base64
	puts "Enter the text you want translated to Base64:"
	input = gets.chomp!.to_s
	new_string = "#{input}"
	puts "'#{input}' in Base64 is: #{Base64.encode64(new_string)}"	
	base64 if restart
end

def md5
	puts "Enter text you want translated to MD5:"
	input = gets.chomp!.to_s
	input_string = Digest::MD5.new
	input_string.update(input)
	puts "'#{input}' translated to MD5: '#{input_string}'"
	md5 if restart
end

def restart
	puts "Would you like to [1]translate another, go back to the [2]main menu, or [3]quit?"
	input = gets.chomp!
	 if input == "1"
	 	return true
	elsif input == "2"
		puts "Redirecting to Menu..."
		welcome_list
	else
		puts "Exiting system..."
		exit
	end
end
welcome_list
