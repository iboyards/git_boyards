alphabet = ("a" .. "z")
vowels_index = {}
vowels = ['a', 'e', 'i', 'o', 'u', 'y']

alphabet.each_with_index do |key, val|
	vowels_index[key] = val + 1 if vowels.include?(key)
end

vowels_index.each{|key, value| print key, "-", value, " "}



