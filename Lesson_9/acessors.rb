
module Accessors
  def attr_accessor_with_history (*args)
    args.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      name_history = "@#{name}_history".to_sym
      define_method ("#{name}_history") { instance_variable_get(name_history) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        instance_variable_set(name_history, []) if instance_variable_get(name_history).nil?
        instance_variable_get(name_history) << value
      end
    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise TypeError if value.class != type
      instance_variable_set(var_name, value)
    end
  end
end