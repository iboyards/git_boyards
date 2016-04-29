month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

=begin 
puts "Enter date"
date = gets.chomp

a = date.split('.')

puts a[0].to_i + a[1].to_i
=end

puts "Enter the year"
year = gets.chomp.to_i

if (year % 400) == 0 || (year % 4) == 0 && (year % 100) != 0 
	month [1] = 29
	else
	month [1] = 28
end

puts "Enter the month"
month_i = gets.chomp.to_i

puts "Enter the day"
day = gets.chomp.to_i
month[month_i-1] = day

i = 0
id = 0
while i < month_i do
	id += month[i]
	i += 1
end

puts "This is #{id} day of the year"




