module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, *args)
      @validates ||= {}
      @validates[name] = *args      
    end
  end

  module InstanceMethods
    def validate!
      valid_variables = self.class.instance_variable_get("@validates")       
      valid_variables.each do |name, args|
        @name_value = instance_variable_get("@#{name}")
        @provision = args[1]
        send args[0]    
      end
    end

    def valid?
      validate!
    rescue RuntimeError
      false
    end

    def presence
      raise ArgumentError,'value is nil or empty' if @name_value.nil? || @name_value == ' '      
      true
    end

    def format      
      raise ArgumentError, "wrong format" if @name_value !~ @provision
      true
    end

    def v_type
      raise ArgumentError, "wrong type is not #{@provision}" if @name_value.class != @provision
      true
    end
  end
end
