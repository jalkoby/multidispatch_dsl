require 'spec_helper'

describe MultidispatchDSL::Generator do
  context '.method_name_from_declaration' do
    specify { should == "execute_empty" }
    specify { subject(Fixnum).should == "execute_fixnum" }
    specify { subject(Fixnum, String).should == "execute_fixnum_string" }
    specify { subject(described_class).should == "execute_multidispatch_dsl_generator" }

    def subject(*declaration)
      described_class.method_name_from_declaration("execute", declaration)
    end
  end

  context '.declaration_from_args' do
    specify { should = "()" }
    specify { subject(Fixnum, String).should == "(Fixnum, String)" }

    def subject(*args)
      described_class.declaration_from_args(args)
    end
  end

  it 'allow set default case' do
    WidgetSerializer.process("string").should == { :string => "string" }
    WidgetSerializer.process(1).should == { :int => 1 }
    WidgetSerializer.process(:symbol).should == { :anything => :symbol }
    WidgetSerializer.process([:array]).should == { :anything => [:array] }
  end
end
