module MultidispatchDSL
  autoload :DSL, 'multidispatch_dsl/dsl'

  def self.included(klass)
    klass.send(:extend, ::MultidispatchDSL::DSL)
  end
end
