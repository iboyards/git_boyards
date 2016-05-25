module Vendor

  def vendor(code)
    self.code = code    
  end

  def vendor?
    puts self.code
  end

  protected

  attr_accessor :code
end
