class MultidispatchDSL::MissingDeclarationError < StandardError

  def initialize(method_name, args)
    super "#{ MultidispatchDSL::Generator.declaration_from_args(args) } for #{ method_name }"
  end
end
