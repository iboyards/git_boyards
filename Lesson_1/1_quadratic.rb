=begin 
Урок 1 "Квадратное уравнение (усложненное задание)"
Пользователь вводит 3 коэффициента a, b и с. 
Программа вычисляет дискриминант (D) 
и корни уравнения (x1 и x2, если они есть) 
и выводит значения дискриминанта и корней на экран. 
При этом возможны следующие варианты:
Если D > 0, то выводим дискриминант и 2 корня
Если D = 0, то выводим дискриминант и 1 корень (т.к. они в этом случае равны)
Если D < 0, то выводим дискриминант и сообщение "Корней нет"
=end

puts "Решение квадратного уравнения"
print "Введите значение коэффициента а="
a = gets.chomp.to_f
print "Введите значение коэффициента b="
b = gets.chomp.to_f
print "Введите значение коэффициента c="
c = gets.to_f

discriminant = (b ** 2) - 4 * a * c
puts "Дискриминант уравнения равен: #{discriminant}"

if discriminant > 0
	x_1 = ( - b + Math.sqrt(discriminant) ) / (2 * a)
	x_2 = ( - b - Math.sqrt(discriminant) ) / (2 * a)
	puts "Корни уравнения равны:"
	puts "X1=#{x_1.round 3}, X2=#{x_2.round 3}"
elsif discriminant == 0
	x = (- b) / (2 * a)
else
	puts "Корней нет"
end

