module MultidispatchDSL
  autoload :DSL, 'multidispatch_dsl/dsl'

  def self.included(klass)
    klass.send(:include, ::MultidispatchDSL::DSL)
  end
end
