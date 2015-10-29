require 'yaml'

def welcome
	puts "Welcome to the Translation Center! To begin press 'B', to quit press 'Q'"
	input = language = gets.chomp!
	if language =~ /b/i
		translate
	elsif language =~ /q/i
		exit
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
welcome
