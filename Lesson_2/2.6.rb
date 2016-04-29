
product = nil
price = nil
quantity = nil
hash_products = {}
i = 0

loop do
	 puts "Enter product name or 'stop' if you want to finish "
     product = gets.chomp
     if product == "stop" 
		break
	end
	puts "Enter the cost per unit of product"
    price = gets.chomp.to_i
	puts "Enter the quantity of the product"
    quantity = gets.chomp.to_i
	hash_products[product]= {'price': price, 'quantity': quantity, 'total': price * quantity}
	i +=1
end 
puts hash_products

all_total = 0
hash_products.each do |key, value|
all_total +=value[:total]
puts "The full cost of the #{key} is #{value[:total]}"
end
#hash_products.each_value { |value| purchase_total += value[:total] }
puts "Total cost = #{all_total}" 
puts "#{}"

