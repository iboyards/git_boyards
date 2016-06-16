require './acessors.rb'

class Test
  extend Accessors

  attr_accessor_with_history :a, :b, :c
  strong_attr_accessor :name, String
end

test = Test.new

test.a = 1
test.a = 2
test.a = 3

test.b = 44
test.c = 55


puts test.name = '8'
#print test.a_history
