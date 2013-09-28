module MultidispatchDSL::Generator
  module_function

  def method_name_from_declaration(base, declaration)
    if declaration.empty?
      "#{ base }_empty"
    else
      prefix = declaration.map { |klass| underscore(klass) }.join('_')
      "#{ base }_#{ prefix }"
    end
  end

  def method_name_from_args(base, args)
    method_name_from_declaration(base, args.map(&:class))
  end

  def declaration_from_args(args)
    list = args.join(', ') { |item| item.class.to_s }
    "(#{ list })"
  end

  # source code was taken from activesupport library
  def underscore(klass)
    word = klass.to_s.dup
    word.gsub!(/::/, '_')
    word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    word.tr!("-", "_")
    word.downcase!
    word
  end
end
