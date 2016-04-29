a = [0, 1]
index = 2
while index <= 99 do 
	f = a[index - 1] + a[index - 2]
	a.push(f)
	index += 1
end
print a