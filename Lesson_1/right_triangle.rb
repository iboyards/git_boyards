=begin
Урок 1 Задание "Прямоугольный треугольник"
Программа запрашивает у пользователя 3 стороны треугольника
и определяет, является ли треугольник прямоугольным, 
используя теорему Пифагора (www-formula.ru) и 
выводит результат на экран. Также, если треугольник 
является при этом равнобедренным (т.е. у него равны любые 2 стороны), 
дополнительно выводится информация о том, что треугольник 
еще и равнобедренный.  
=end
puts "Введите значения сторон треугольника"
side_1 = gets.chomp.to_f
side_2 = gets.chomp.to_f
side_3 = gets.to_f

if side_1 == side_2 || side_2 == side_3 || side_1 == side_3
	type_triangle = "равнобедренный"
else
	type_triangle = " "
end

if side_3 < side_3 && side_2 < side_3 

	if (side_3**2) == (side_2**2 + side_3**2)
		type_triangle2 = "Треугольник прямоугольный"
	else
		type_triangle2 = "Треугольник"
	end
	
elsif side_2 > side_3

	if (side_2**2) == (side_3**2 + side_3**2)
		type_triangle2 = "Треугольник прямоугольный"
	else
		type_triangle2 = "Треугольник"
	end

else

	if (side_3**2) == (side_1**2 + side_2**2)
		type_triangle2 = "Треугольник прямоугольный"
	else
		type_triangle2 = "Треугольник"
	end
end

puts "#{type_triangle2} #{type_triangle}"