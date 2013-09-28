class TestClass
  include MultidispatchDSL

  mdef(:hello, Fixnum) do |i|
    "Fixnum version with number #{ i }"
  end

  mdef(:hello, String) do |str|
    "String version with string #{ str }"
  end

  mdef(:hello, Fixnum, String) do |i, str|
    "Fixnum String version with #{ i } & #{ str }"
  end

  mdef(:hello, String, Fixnum) do |str, i|
    "String Fixnum version with #{ str } & #{ i }"
  end

  mdef(:hello) do
    "Version without args"
  end

  mdef(:hello, Symbol) do |symbol|
    "Symbol version with :#{ symbol } & :#{ internal_method }"
  end

  mdef(:hello, String, String) do |str_one, str_two, &block|
    instance_exec(str_one.upcase, str_two.downcase, &block)
  end

  def internal_method
    :internal_method
  end
end
