require 'yaml'

def welcome
	puts "Welcome to the Translation Center! Please enter the language you would like to translate to English or you can choose from the list below:  
	1. Spanish
	2. Russian
	3. Arabic"
	input = language = gets.chomp!
	case input
	when /spanish/i
		spanish_translate
	when "1"
		spanish_translate
	when /russian/i
		russian_translate
	when "2"
		russian_translate
	when /arabic/i
		arabic_translate
	when "3"
		arabic_translate
	else
		puts "Language is not yet supported within Tranlation Center."
		exit
	end
end

def spanish_translate
	translations = YAML.load_file 'spanish.yml'
	puts "Enter word or phrase to be translated to English, press 'Q' to quit:"
	input = gets.chomp
	case
	when translations[input]
		puts "The translation from Spanish to English is: #{translations[input]}"
	when input =~ /q/i
		exit
	else
		puts "Invalid word or phrase redirecting..."
		spanish_translate
	end
end

def russian_translate
	translation = YAML.load_file 'russian.yml'
	puts "Enter word or phrase you would like translated to English, press 'Q' to quit:"
	input = gets.chomp!
	case
	when translations[input]
		puts "The translation from Russian to English is: #{translations[input]}"
	when input =~ /q/i
		exit
	else
		puts "Invalid word or phrase redirecting..."
		russian_translate
	end
end

def arabic_translate
	translation = YAML.load_file 'arabic.yml'
	puts "Enter word or phrase you woukd like translated to English, press 'Q' to quit:"
		input = gets.chomp!
	case
	when translations[input]
		puts "The translation from Arabic to English is: #{translations[input]}"
	when input =~ /q/i
		exit
	else
		puts "Invalid word or phrase redirecting..."
		arabic_translate
	end
end
welcome
