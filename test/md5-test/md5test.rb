require 'digest' 

puts "Enter input:"
input = gets.chomp!.to_s
input_string = Digest::MD5.new
input_string.update(input)
puts input_string
