require 'multidispatch_dsl/generator'
require 'multidispatch_dsl/missing_declaration_error'

module MultidispatchDSL::DSL
  def mdef(method_name, *declaration, &block)
    real_method_name = ::MultidispatchDSL::Generator.method_name_from_declaration(method_name, declaration)
    define_method(real_method_name, &block)

    unless method_defined?(method_name)
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{ method_name }(*args, &block)
          real_method_name = ::MultidispatchDSL::Generator.method_name_from_args(__callee__, args)
          if respond_to?(real_method_name)
            send(real_method_name, *args, &block)
          else
            fallback_method_name = "#{ method_name }_anything"
            if respond_to?(fallback_method_name)
              send(fallback_method_name, *args, &block)
            else
              raise ::MultidispatchDSL::MissingDeclarationError.new(__callee__, args)
            end
          end
        end
      RUBY
    end
  end
end
