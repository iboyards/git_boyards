alphabet = ("a" .. "z")
vowels = {}

alphabet.each_with_index do |key, val|
	vowels[key] = val + 1 if %w[a e i o u y].include?(key)
end

vowels.each{|key, value| print key, "-", value, " "}



