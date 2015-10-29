def base64
	new_string = "TEST"
	puts "'#{input}' in Base64 is: #{Base64.encode64(new_string)}"	
end
base64
# => VEVTVA==
