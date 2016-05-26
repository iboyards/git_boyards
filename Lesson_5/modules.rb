module Vendor

  attr_accessor :code

  def vendor(code)
    self.code = code    
  end

  def vendor?
    puts self.code
  end
 
end
