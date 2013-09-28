require 'spec_helper'

describe MultidispatchDSL do
  subject { TestClass.new }

  specify { subject.hello.should == "Version without args" }
  specify { subject.hello(1).should == "Fixnum version with number 1" }
  specify { subject.hello(:foo).should == "Symbol version with :foo & :internal_method" }
  specify { subject.hello(1, "string").should == "Fixnum String version with 1 & string" }
  specify { subject.hello("string", 1).should == "String Fixnum version with string & 1" }
  specify { expect { subject.fooo }.to raise_error(NameError) }
  specify { expect { subject.hello(:not, :defined).to raise_error(MultidispatchDSL::MissingDeclarationError) } }

  it 'allow yield in methods' do
    subject.hello('One', 'Two') do |str_one, str_two|
      "#{str_one} #{ str_two } #{ internal_method }"
    end.should == "ONE two internal_method"
  end
end
